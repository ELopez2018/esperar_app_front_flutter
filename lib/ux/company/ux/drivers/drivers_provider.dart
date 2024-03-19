import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/users_response_model.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class DriversProvider extends ChangeNotifier{
 UsersResponseModel? pageableDrivers;
  List<UserModel?>? drivers;
    final LocalStorageInterface localStorageInterface;
    final UserService userService;

  DriversProvider({required this.localStorageInterface, required this.userService});


    Future init() async {
    final user = await localStorageInterface.getUser();
    try {
      final response = await userService.findUserByIdCompany(user!.id);
      if (response != null) {
        pageableDrivers = response;
        drivers = response.content.isNotEmpty ? response.content : [];
      } else {
        drivers = [];
      }
      notifyListeners();
    } on String catch (_) {
      print(_);
    }
  }
}
