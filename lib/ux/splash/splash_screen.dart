import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/splash/spalsh_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
        authService: Provider.of<AuthService>(context, listen: false),
        userService: Provider.of<UserService>(context, listen: false),
        companyService: Provider.of<CompanyService>(context, listen: false),
        vehicleService: Provider.of<VehicleService>(context, listen: false),
      ),
      builder: (context, child) => const SplashScreen._(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    validatedAuthenticationUser();
    super.initState();
  }

  validatedAuthenticationUser() async {
    final bloc = Provider.of<SplashProvider>(context, listen: false);
    final result = await bloc.validatedUserAuthentication();
    if (result) {
      pushReplacement(context, 'select-driver', null);
    } else {
      pushReplacement(context, 'welcome', null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/images/splash-f.png',
          fit: BoxFit.cover,
          height: size.height,
        )),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.5),)),
        Positioned( top: size.height / 2 - size.width * 0.4, left: size.width *0.3, right: size.width * 0.3, child: Image.asset('assets/icons/logo.png' , height: size.width * 0.4, ))
      ],
    ));
  }
}
