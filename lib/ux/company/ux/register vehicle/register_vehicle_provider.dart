import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class RegisterVehicleProvider extends ChangeNotifier {
  RegisterVehicleProvider(
      {required this.vehicleService, required this.userService, required this.localStorageInterface});
  final VehicleService vehicleService;
  final UserService userService;
  final LocalStorageInterface localStorageInterface;

  final TextEditingController licensePlate = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController cylinderCapacity = TextEditingController();
  final TextEditingController capacity = TextEditingController();
  final TextEditingController occupancy = TextEditingController();
  final TextEditingController driverId = TextEditingController();
  final TextEditingController companyId = TextEditingController();
  final TextEditingController soatExpirationDate = TextEditingController();
  final TextEditingController tecnoMechanicalExpirationDate = TextEditingController();

  List<UserModel>? drivers;


void init() async {
  final user = await localStorageInterface.getUser();
final driversResponse = await userService.findUserByIdCompany(user!.id);
if(driversResponse != null){
  print(driversResponse);
  drivers = driversResponse.content;
  notifyListeners();
}
}


  void createVehicle() async {
    final vehicleResponse = await vehicleService.createVehicle(
      VehicleRequestModel(
        licensePlate: licensePlate.text,
        brand: brand.text,
        model: model.text,
        color: '',
        year: int.parse(year.text),
        cylinderCapacity: double.parse(cylinderCapacity.text),
        capacity: int.parse(capacity.text),
        occupancy: int.parse(occupancy.text),
        driverId: 1,
        companyId: 1,
      ),
    );
  }

    List<DropdownMenuItem<String>> getDrives() {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem<String>(
        value: 'Elige un Conductor',
        child: Text(
          'Elige un conductor',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ];

    items.addAll(
      drivers!.map((user) {
        return DropdownMenuItem<String>(
          value: user.firstName,
          child: Text(
            user.firstName!,
            style: const TextStyle(color: Colors.black),
          ),
        );
      }),
    );

    return items;
  }

/*
InputCustom(label: 'Placa'),
              InputCustom(label: 'Placa Secundaria'),
              InputCustom(label: 'Marca'),
              InputCustom(label: 'Modelo'),
              InputCustom(label: 'Color'),
              InputCustom(label: 'Año'),
              InputCustom(label: 'Cilindraje'),
              InputCustom(label: 'Capacidad'),
              DatePickerCustom(
                label: 'Expiracion del soat',
              ),
              DatePickerCustom(
                label: 'Expiracion de la tecnomecanica',
              ),
*/
}
