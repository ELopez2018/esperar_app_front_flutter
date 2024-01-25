import 'dart:convert';

import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _accessToken = 'accessToken';
const _user = 'user';
const _vehicle = 'vehicle';
const _route = 'route';

class LocalStorageImplementation extends LocalStorageInterface {
  @override
  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessToken);
  }

  @override
  Future<RouteModel?> getRoute() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final routeJson = sharedPreferences.getString(_route);
    if (routeJson != null) {
      return RouteModel.fromJson(jsonDecode(routeJson));
    }
    return null;
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userJson = sharedPreferences.getString(_user);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  @override
  Future<VehicleModel?> getVehicle() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final vehicleJson = sharedPreferences.getString(_vehicle);
    if (vehicleJson != null) {
      return VehicleModel.fromJson(jsonDecode(vehicleJson));
    }
    return null;
  }

  @override
  Future setAccessToken(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessToken);
  }

  @override
  Future setRoute(RouteModel route) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_route, jsonEncode(route));
  }

  @override
  Future setUser(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_user, jsonEncode(user));
  }

  @override
  Future setVehicle(VehicleModel vehicle) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_vehicle, jsonEncode(vehicle));
  }
}
