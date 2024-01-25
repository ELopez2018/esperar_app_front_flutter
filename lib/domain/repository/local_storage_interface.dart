import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';

abstract class LocalStorageInterface{
  Future setAccessToken(String value);
  Future<String?> getAccessToken();
  Future setUser(UserModel user);
  Future<UserModel?> getUser();
  Future setVehicle(VehicleModel vehicle);
  Future<VehicleModel?> getVehicle();
  Future setRoute(RouteModel route);
  Future<RouteModel?> getRoute();
}