import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier{
  final LocalStorageInterface localStorageInterface;
  VehicleModel? _vehicle;

  ProfileProvider({required this.localStorageInterface});

  void init() async {
    final vehicle = await localStorageInterface.getVehicle();
    if(vehicle != null){
      setVehicle(vehicle);
    }
  }


  void setVehicle(VehicleModel vehicle){
    _vehicle = vehicle;
    notifyListeners();
  }

  VehicleModel? getVehicle() => _vehicle;
}