import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_update_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  EditProfileProvider({
    required this.localStorageInterface,
    required this.userService,
  });

  final LocalStorageInterface localStorageInterface;
  final UserService userService;
  UserModel? _user;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void init() async {
    final user = await localStorageInterface.getUser();
    if (user != null) {
      firstName.text = user.firstName ?? '';
      secondName.text = user.secondName ?? '';
      lastName.text = user.lastName ?? '';
      email.text = user.email ?? '';
      phone.text = user.phone ?? '';
      setUser(user);
    }
  }

  Future<bool?> updateUser() async {
    final accessToken = await localStorageInterface.getAccessToken();
    final user = await localStorageInterface.getUser();
    try {
      final userUpdate = await userService.updateUser(
        user!.id,
        UserUpdateModel(
            email: email.text,
            username: user.username,
            image: user.image,
            firstName: firstName.text,
            secondName: secondName.text,
            lastName: lastName.text,
            gender: user.gender,
            documentNumber: user.documentNumber,
            documentType: user.documentType,
            phone: int.parse(phone.text),
            currentCountry: user.currentCountry),
      );
      if(userUpdate != null){
        localStorageInterface.setUser(userUpdate);
        return true;
      }
      return false;
    } on String catch (_) {
      print(_);
    }
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  UserModel? getUser() => _user;
}


/*

    "id": 1,
    "licensePlate": "ry",
    "secondaryPlate": "5300",
    "model": "Camry",
    "brand": "Toyota",
    "year": 2024,
    "color": "Red",
    "cylinderCapacity": 2.5,
    "capacity": 5,
    "occupancy": 2,
    "drivers": []

 */