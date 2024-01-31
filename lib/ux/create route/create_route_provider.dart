import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class CreateRouteProvider extends ChangeNotifier {
  final RouteService routeService;
  final LocalStorageInterface localStorageInterface;

  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();

  CreateRouteProvider(
      {required this.routeService, required this.localStorageInterface});

  Future<RouteModel?> createRoute() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    try {
      final response = await routeService.createRoute(accessToken!,
          RouteRequestModel(name: 'ruta 1', from: from.text, to: to.text));
      if (response != null) {
        return response;
      }
    } on String catch (_) {}
  }
}
