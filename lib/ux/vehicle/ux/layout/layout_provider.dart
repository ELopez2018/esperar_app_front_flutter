import 'dart:async';

import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LayoutProvider extends ChangeNotifier {
  int _page = 0;
  RouteModel? route;
  Set<Polyline> polylines = {};

  late StreamSubscription<Position> _positionStreamSubscription;
  Position? _currentPosition;

  void setPage(int value) {
    _page = value;
    notifyListeners();
  }

  int getPage() => _page;

  addPolilyne(List<LatLng> points) {
    polylines = {};
    final myRoute = Polyline(
        polylineId: const PolylineId("route"),
        color: Colors.blue,
        points: points,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        width: 5);
    polylines.add(myRoute);
  }

  LayoutProvider() {
    _initLocationTracking();
  }

  void _initLocationTracking() {
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((position) {
      _currentPosition =
          position;
    });
  }

  Position? get currentPosition => _currentPosition;

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    super.dispose();
  }
}
