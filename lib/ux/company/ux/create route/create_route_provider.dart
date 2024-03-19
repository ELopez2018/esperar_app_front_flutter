import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class CreateRouteProvider extends ChangeNotifier {
  CreateRouteProvider({
    required this.routeService,
    required this.localStorageInterface,
  });

  final RouteService routeService;
  final LocalStorageInterface localStorageInterface;
  final TextEditingController name = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  bool _isMap = false;
  StateProgress state = StateProgress.initial;
  bool getIsMap() => _isMap;

  void setIsMap(bool? value) {
    _isMap = value!;
    notifyListeners();
  }

  Future<RouteModel?> createRoute() async {
    state = StateProgress.loading;
    notifyListeners();
    try {
      final response = await routeService.createRoute(
        RouteRequestModel(
          name: name.text,
          from: from.text,
          to: to.text,
          coordinates: [],
          stations: []
        ),
      );
      if (response != null) {
        state = StateProgress.initial;
        notifyListeners();
        return response;
      }
      state = StateProgress.initial;
      notifyListeners();
    } on String catch (_) {
      state = StateProgress.initial;
      notifyListeners();
    }
    return null;
  }
}
