import 'package:esperar_app_front_flutter/data/models/auth/auth_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/companies/company_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider(
      {required this.localStorageInterface, required this.authService, required this.userService, required this.companyService, required this.vehicleService,});
  final LocalStorageInterface localStorageInterface;
  final AuthService authService;
  final UserService userService;
  final CompanyService companyService;
  final VehicleService vehicleService;

  Future<bool> validatedUserAuthentication() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    if (accessToken != null && await localStorageInterface.getUser() != null) {
      try {
        final responseAuth = await userService.singUp(AuthRequestModel(
            username: 'SXC231',
            password: 'Secret123.',
            confirmPassword: 'Secret123.'));
        if (responseAuth != null) {
          final companyResponse = await companyService.createCompany(
            responseAuth.accessToken,
              CompanyRequestModel(
                  name: 'Macarena',
                  address: 'Villavicencio, Meta',
                  phoneNumber: 3002001020,
                  email: 'macarena@info.com',
                  website: 'https://macarena.com'));
          final vehicleResponse = await vehicleService.createVehicle(
            responseAuth.accessToken,
              VehicleRequestModel(
                  licensePlate: 'SXC231',
                  brand: '5300',
                  model: 'Toyota',
                  color: 'Red',
                  year: 2024,
                  cylinderCapacity: 2.5,
                  capacity: 5,
                  occupancy: 2,
                  companyId: companyResponse!.id,
                  driverId: responseAuth.id));
          vehicleService.assignDriverToVehicle(
              responseAuth.accessToken, vehicleResponse!.id, responseAuth.id);
        }
        final user = await authService.getUserTemp(accessToken);
        if (user != null) {
          return true;
        }
      } on String catch (_) {
        print(_);
      }
    }
    return false;
  }
}
