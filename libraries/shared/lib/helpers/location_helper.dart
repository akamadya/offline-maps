import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationHelper {
  factory LocationHelper() {
    return _instance;
  }

  LocationHelper._internal();

  static final LocationHelper _instance = LocationHelper._internal();

  final geoPlatform = GeolocatorPlatform.instance;

  Future<LocationPermission> requestPermission() async {
    await geoPlatform.checkPermission().then((value) {
      if (value == LocationPermission.always ||
          value == LocationPermission.whileInUse) {
        return value;
      }
    });

    return geoPlatform.requestPermission();
  }

  Future<Position> getPosition() async {
    return geoPlatform.getCurrentPosition();
  }

  Future<double?> distance(LatLong position, LatLong otherPosition) async {
    final distance = geoPlatform.distanceBetween(
      position.lat,
      position.long,
      otherPosition.lat,
      otherPosition.long,
    );
    return distance;
  }
}

Future<bool> isLocationWithinRadius({
  required double posLat,
  required double posLong,
  required double checkLat,
  required double checkLong,
  required double radiusInMeters,
}) async {
  final distance = Geolocator.distanceBetween(
    posLat,
    posLong,
    checkLat,
    checkLong,
  );

  return distance <= radiusInMeters;
}

class LatLong {
  LatLong(this.lat, this.long, {this.alt});

  final double lat;
  final double long;
  final double? alt;
}
