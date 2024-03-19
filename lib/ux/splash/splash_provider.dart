import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({
    required this.localStorageInterface,
    required this.authService,
    required this.userService,
    required this.companyService,
    required this.vehicleService,
  });
  final LocalStorageInterface localStorageInterface;
  final AuthService authService;
  final UserService userService;
  final CompanyService companyService;
  final VehicleService vehicleService;
  String rol = '';
  String? error;


  Future<bool?> validatedUserAuthentication() async {
    try {
      final accessToken = await localStorageInterface.getAccessToken();
      final user = await localStorageInterface.getUser();
      if (accessToken != null && user != null) {
        final userResponse = await authService.getUser(accessToken);
        if (userResponse != null) {
          rol = userResponse.rol.name;
          return true;
        }
      }
      return false;
    } on String catch (_) {
      error = _;
    }
    return false;
  }
}
