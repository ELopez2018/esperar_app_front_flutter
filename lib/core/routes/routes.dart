
import 'package:esperar_app_front_flutter/ux/screens.dart';
import 'package:esperar_app_front_flutter/ux/welcome%20screen/welcome_screen.dart';
import 'package:flutter/material.dart';

routes(BuildContext context)  => {
  '/': (context) => SplashScreen.init(context),
  'welcome': (context) => WelcomeScreen.init(context),
  'login': (context) => LoginScreen.init(context),
  'register-company': (context) => RegisterCompanyScreen.init(context)
};
