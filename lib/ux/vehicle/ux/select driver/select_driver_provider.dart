import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class SelectDiverProvider extends ChangeNotifier{
  SelectDiverProvider({required this.localStorageInterface, required this.userService});

final LocalStorageInterface localStorageInterface;
  final UserService userService;
  VehicleModel? _vehicle;
  List<UserModel> users = [];
  bool selectUser = false;

  void init() async {
    final vehicle = await localStorageInterface.getVehicle();
    final user = await localStorageInterface.getUser();
    final accessToken = await localStorageInterface.getAccessToken();
    if(vehicle != null){
      setVehicle(vehicle);
      users.add(user!);
    }
  }


  void setVehicle(VehicleModel vehicle){
    _vehicle = vehicle;
    notifyListeners();
  }

  void setSelectUser(){
    selectUser = !selectUser;
    notifyListeners();
  }

  VehicleModel? getVehicle() => _vehicle;
}