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

  Future<bool> validatedUserAuthentication() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    if (accessToken != null && await localStorageInterface.getUser() != null) {
      try {
        final user = await authService.getUserTemp(accessToken);

        if (user != null) {
          if (user.company != null && user.company!.vehicles!.isNotEmpty) {
            if (user.company!.vehicles!
                .contains(await localStorageInterface.getVehicle())) {
              return true;
            }
          }
          localStorageInterface.clean();
          return false;
        }
        await localStorageInterface.clean();
      } on String catch (_) {
        print(_);
      }
    }
    return false;
  }
}
