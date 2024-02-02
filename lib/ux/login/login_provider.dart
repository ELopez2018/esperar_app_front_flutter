import 'package:esperar_app_front_flutter/data/models/auth/auth_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({
    required this.authService,
    required this.localStorageInterface,
    required this.userService,
    required this.companyService,
  });

  final AuthService authService;
  final UserService userService;
  final CompanyService companyService;
  final LocalStorageInterface localStorageInterface;
  final TextEditingController plate = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<bool?> login() async {
    try {
      final result = await authService.login(
          AuthRequestModel(username: plate.text, password: password.text));
      if (result != null) {
        final userTemp = await authService.getUserTemp(result.accessToken);
        if (userTemp != null) {
          final user =
              await userService.findUserById(userTemp.id, result.accessToken);
          final company = await companyService.findCompanyById(
              userTemp.company!.id, result.accessToken);
          if (user != null && company != null) {
            await localStorageInterface.setAccessToken(result.accessToken);
            await localStorageInterface.setUser(user);
            await localStorageInterface.setVehicle(company.vehicles!.first);
            return true;
          }
        }
      }
      return false;
    } on String catch (_) {
      print(_);
    }
  }
}
