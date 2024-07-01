import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
import 'package:mbtiles/mbtiles.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';
import 'package:latlong2/latlong.dart' as latLong;

class CoalPage extends StatefulWidget {
  const CoalPage({super.key});

  @override
  State<CoalPage> createState() => _CoalPageState();
}

class _CoalPageState extends State<CoalPage> {
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
      'assets/maps/coal2.mbtiles',
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
                initialCenter: latLong.LatLng(2.166283, 117.603808),
                maxZoom: 19,
                minZoom: 15,
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  tileProvider: MbTilesTileProvider(
                      mbtiles: _mbtiles!, silenceTileNotFound: true),
                ),
                PolylineLayer(polylines: [
                  Polyline(points: const [
                    latLong.LatLng(2.1753153, 117.6105208),
                    latLong.LatLng(2.1737203, 117.6123305),
                    latLong.LatLng(2.1737317, 117.6129841),
                    latLong.LatLng(2.1733474, 117.6136202),
                    latLong.LatLng(2.1724104, 117.6140709),
                    latLong.LatLng(2.1709152, 117.6137522),
                    latLong.LatLng(2.1684128, 117.6148443),
                    latLong.LatLng(2.165713, 117.613588),
                    latLong.LatLng(2.164574, 117.612246),
                    latLong.LatLng(2.162921, 117.612453),
                    latLong.LatLng(2.160172, 117.617773),
                    latLong.LatLng(2.160242, 117.618051),
                    latLong.LatLng(2.159218, 117.618629),
                    latLong.LatLng(2.159241, 117.619392),
                    latLong.LatLng(2.158380, 117.619600),
                    latLong.LatLng(2.155966, 117.617711),
                    latLong.LatLng(2.155151, 117.618266),
                    latLong.LatLng(2.1548424, 117.6183901),
                    latLong.LatLng(2.1544933, 117.6183640),
                    latLong.LatLng(2.1533155, 117.6172501),
                    latLong.LatLng(2.1532633, 117.6167035),
                    latLong.LatLng(2.1533886, 117.6162467),
                    latLong.LatLng(2.1542560, 117.6152898),
                    latLong.LatLng(2.156448, 117.607864),
                    latLong.LatLng(2.157543, 117.604730),
                    latLong.LatLng(2.161884, 117.605264),
                    latLong.LatLng(2.162430, 117.606525),
                    latLong.LatLng(2.163652, 117.606560),
                    latLong.LatLng(2.165921, 117.607625),
                    latLong.LatLng(2.167958, 117.605648),
                    latLong.LatLng(2.170146, 117.606262),
                    latLong.LatLng(2.1753153, 117.6105208),
                  ], color: Colors.black, strokeWidth: 3),
                  // Polyline(points: const [
                  //   latLong.LatLng(2.169355, 117.604087),
                  //   latLong.LatLng(2.169286, 117.602791),
                  //   latLong.LatLng(2.168658, 117.602739),
                  //   latLong.LatLng(2.1681986, 117.6013289),
                  //   latLong.LatLng(2.1682918, 117.6009530),
                  //   latLong.LatLng(2.1679951, 117.6008083),
                  //   latLong.LatLng(2.1678264, 117.6008487),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  //   // latLong.LatLng(),
                  // ], color: Colors.black, strokeWidth: 3),
                ]),
                PolygonLayer(
                  polygons: [
                    Polygon(
                        points: const [
                          latLong.LatLng(2.173507, 117.610860),
                          latLong.LatLng(2.169812, 117.606486),
                          latLong.LatLng(2.16860552, 117.60607763),
                          latLong.LatLng(2.167940, 117.606020),
                          latLong.LatLng(2.166255, 117.607880),
                        ],
                        color: Colors.red.withOpacity(.45),
                        label: 'Danger\nZone',
                        labelStyle:
                            Styles.textMBold.copyWith(color: Colors.white)),
                    Polygon(
                        points: const [
                          latLong.LatLng(2.173507, 117.610860),
                          latLong.LatLng(2.166255, 117.607880),
                          latLong.LatLng(2.1663653, 117.6094851),
                          latLong.LatLng(2.1662653, 117.6107585),
                          latLong.LatLng(2.166481, 117.612044),
                          latLong.LatLng(2.166832, 117.612369),
                          latLong.LatLng(2.168610, 117.612451),
                          latLong.LatLng(2.169710, 117.612812),
                          latLong.LatLng(2.1709638, 117.6127868),
                          latLong.LatLng(2.1714390, 117.6130268),
                          latLong.LatLng(2.1726576, 117.6119443),
                        ],
                        color: Colors.orange.withOpacity(.45),
                        label: 'Warning\nZone',
                        labelStyle:
                            Styles.textMBold.copyWith(color: Colors.white)),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const latLong.LatLng(2.166283, 117.603808),
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
}
