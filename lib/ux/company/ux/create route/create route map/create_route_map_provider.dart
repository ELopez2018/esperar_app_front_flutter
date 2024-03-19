import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateRouteMapProvider extends ChangeNotifier {
  CreateRouteMapProvider(
      {required this.routeService, required this.localStorageInterface});

  final RouteService routeService;
  final LocalStorageInterface localStorageInterface;
  Set<Marker> _market = {};
  Polyline? _polyline;
  List<LatLng> polylinePoints = [];
  late RouteModel _route;
  StateProgress state = StateProgress.initial;

  void onTap(LatLng point) {
    paintMarket(point);
    polylinePoints.add(point);
    notifyListeners();
  }

  void paintMarket(LatLng point) {
    if (_market.isNotEmpty) return;
    final MarkerId markerId = MarkerId(0.toString());
    final market = Marker(
      markerId: markerId,
      position: point,
    );
    _market.add(market);
    paintPolyline();
  }

  void paintPolyline() {
    _polyline = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.blue,
      points: polylinePoints,
    );
  }

  void removePoint() {
    if (polylinePoints.isEmpty) return;
    polylinePoints.removeLast();
    paintPolyline();
    notifyListeners();
  }

  Set<Marker> getMarkets() => _market;
  Polyline? getPolyline() => _polyline;

  void setIdPoint(RouteModel value) {
    _route = value;
    notifyListeners();
  }

  Future<RouteModel?> updateRoute() async {
    state = StateProgress.loading;
    notifyListeners();
    try {
      final response = await routeService.updateRoute(
          _route.id!,
          RouteRequestModel(
            name: _route.name!,
            from: _route.from!,
            to: _route.to!,
            coordinates: polylinePoints
                .map(
                  (e) => CoordinatesRequestModel(
                    latitude: e.latitude.toString(),
                    longitude: e.longitude.toString(),
                  ),
                )
                .toList(),
                stations: []
          ),
          );
      if (response != null) {
        state = StateProgress.initial;
        notifyListeners();
        return response;
      }
    } on String catch (_) {}
  }
}
