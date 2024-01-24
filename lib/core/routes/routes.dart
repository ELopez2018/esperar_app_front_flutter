import 'package:esperar_app_front_flutter/ux/screens.dart';
import 'package:flutter/material.dart';

routes(BuildContext context) => {
  'splash': (context) => const SplashScreen(),
  'welcome': (context) => const WelcomeScreen(),
  'login': (context) => const LoginScreen(),
  'select-driver': (context) => const SelectDriverScreen(),
  'layout': (context) => LayoutScreen.init(context),
  'new-route': (context) => const CreateRouteScreen(),
  'edit-profile': (context) => const EditProfile(),
};