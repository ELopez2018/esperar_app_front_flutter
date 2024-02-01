import 'package:esperar_app_front_flutter/ux/screens.dart';
import 'package:flutter/material.dart';

routes(BuildContext context) => {
  'splash': (context) =>  SplashScreen.init(context),
  'welcome': (context) => const WelcomeScreen(),
  'login': (context) =>  LoginScreen.init(context),
  'select-driver': (context) =>  SelectDriverScreen.init(context),
  'layout': (context) => LayoutScreen.init(context),
  'new-route': (context) => CreateRouteScreen.init(context),
  'edit-profile': (context) =>  EditProfile.init(context),
  'create-news': (context) => CreateNewsScreen.init(context)
};