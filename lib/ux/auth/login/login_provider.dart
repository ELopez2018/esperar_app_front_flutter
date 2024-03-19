import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/data/models/auth/auth_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(
      {required this.authService,
      required this.userService,
      required this.companyService,
      required this.vehicleService,
      required this.localStorageInterface});
  bool _showRecoverPassword = false;
  final AuthService authService;
  final UserService userService;
  final CompanyService companyService;
  final VehicleService vehicleService;
  final LocalStorageInterface localStorageInterface;
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? rol;
  String? error;

  StateProgress state = StateProgress.initial;

  Future<bool?> login() async {
    try {
      state = StateProgress.loading;
      notifyListeners();
      final result = await authService.login(
          AuthRequestModel(username: user.text, password: password.text));
      if (result != null) {
        final userResponse = await authService.getUserTemp(result.accessToken);
        if (userResponse != null) {
          await localStorageInterface.setAccessToken(result.accessToken);
          await localStorageInterface.setUser(userResponse);
          rol = userResponse.rol.name;
          state = StateProgress.initial;
          notifyListeners();
          return true;
        }
      }
      state = StateProgress.initial;
      notifyListeners();
      return false;
    } on String catch (_) {
      state = StateProgress.initial;
      notifyListeners();
      error = _;
    }
  }

  void setShowRecoverPassword() {
    _showRecoverPassword = !_showRecoverPassword;
    notifyListeners();
  }

  bool getShowRecoverPassword() => _showRecoverPassword;
}
