import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
import 'package:mbtiles/mbtiles.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';
import 'package:latlong2/latlong.dart' as latLong;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;
  //MbTilesTileProvider? futureTileProvider;
  final Future<MbTiles> _futureMbtiles = _loadMbTiles();
  MbTiles? _mbtiles;

  @override
  void initState() {
    super.initState();

    _accessPermision();
  }

  @override
  void dispose() {
    // close the open database connection
    _mbtiles?.dispose();
    super.dispose();
  }

  static Future<MbTiles> _loadMbTiles() async {
    final file = await copyAssetTofile(
      'assets/maps/wonokerto.mbtiles',
      //'assets/maps/countries-raster.mbtiles',
      //'assets/maps/desa-pleret.mbtiles',
      //'assets/maps/coal2.mbtiles',
    );
    log('file: ${file.path}');

    return MbTiles(mbtilesPath: file.path);
  }

  Future<void> _accessPermision() async {
    final status = await Permission.manageExternalStorage.status;
    log('status Storage: $status');

    if (status == PermissionStatus.denied) {
      await Permission.manageExternalStorage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MbTiles>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _mbtiles = snapshot.data;
            return FlutterMap(
              options: const MapOptions(
                initialCenter:
                    latLong.LatLng(-7.867223307120981, 110.39827709568478),
                //latLong.LatLng(2.1654837720141744, 117.60620794878953),
                // maxZoom: 18,
                // minZoom: 15,
                // initialZoom: 15,
                maxZoom: 19,
                minZoom: 12,
              ),
              children: [
                TileLayer(
                  tileProvider: MbTilesTileProvider(
                      mbtiles: _mbtiles!, silenceTileNotFound: true),
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      // point: const latLong.LatLng(
                      //     2.1654837720141744, 117.60620794878953),
                      point: const latLong.LatLng(
                          -7.867223307120981, 110.39827709568478),
                      width: 13,
                      height: 13,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                PolygonLayer(
                  polygons: [
                    Polygon(
                        points: const [
                          latLong.LatLng(
                              -7.848657793488818, 110.39074564761349),
                          latLong.LatLng(-7.852349364191801, 110.3968209652164),
                          latLong.LatLng(
                              -7.862864567560591, 110.39490125519318),
                          latLong.LatLng(-7.863085357323033, 110.38586795845221)
                        ],
                        color: Colors.red.withOpacity(.45),
                        label: 'Danger\nZone',
                        labelStyle:
                            Styles.textMBold.copyWith(color: Colors.black)),
                    Polygon(
                        points: const [
                          latLong.LatLng(
                              -7.853167114897104, 110.40980542262449),
                          latLong.LatLng(-7.85294646506226, 110.40392512019768),
                          latLong.LatLng(
                              -7.863074171661176, 110.40198729326157),
                          latLong.LatLng(
                              -7.8655233184990045, 110.40298961753886),
                          latLong.LatLng(
                              -7.866383826116909, 110.40780077406991),
                          latLong.LatLng(
                              -7.8617944315260075, 110.40875855060153),
                        ],
                        color: Colors.orange.withOpacity(.45),
                        label: 'Warning\nZone',
                        labelStyle:
                            Styles.textMBold.copyWith(color: Colors.black)),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            log('error: ${snapshot.error}');
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: _futureMbtiles,
      ),
      //body: _dummyPage('Home', Colors.blue),
    );
  }

  Container _dummyPage(String title, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: Styles.textXLRegular,
        ),
      ),
    );
  }
}

enum BottomNavigationBarItemType { space, item }
