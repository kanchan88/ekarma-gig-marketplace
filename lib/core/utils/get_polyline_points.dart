import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

FutureOr<void> getPolylineBetweenTwoPoints(
    LatLng source, LatLng destination, setState, routePoints, polylinePoints) async {
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.get("GOOGLE_MAPS_API_KEY"),
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude));
  if (result.points.isNotEmpty) {
    for (var point in result.points) {
      setState(() {
        routePoints.add(LatLng(point.latitude, point.longitude));
      });
    }
  }
}
