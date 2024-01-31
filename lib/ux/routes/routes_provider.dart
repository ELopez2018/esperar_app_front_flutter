import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/routes_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class RoutesProvider extends ChangeNotifier {
  RoutesProvider({
    required this.routeService,
    required this.localStorageInterface,
  });

  final RouteService routeService;
  final LocalStorageInterface localStorageInterface;
  RoutesResponseModel? PageableRoutes;
   List<RouteModel?>? routes;
   UserModel? user;

  Future init() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    user = await localStorageInterface.getUser();
    try {
      final response = await routeService.findAllRoutes(accessToken!);
      if (response != null) {
        PageableRoutes = response;
        routes = response.content.isNotEmpty ? response.content : [];
      }else{
        routes = [];
      }
      notifyListeners();
    } on String catch (_) {
      print(_);
    }
  }

  void addRoute(RouteModel route){
    routes!.add(route);
    notifyListeners();
  }
}
