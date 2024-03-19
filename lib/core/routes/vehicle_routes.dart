import 'package:esperar_app_front_flutter/ux/vehicle/ux/screen.dart';
import 'package:flutter/material.dart';

vehicleRoutes(BuildContext context) => {
  'welcome-vehicle': (context) => const WelcomeVehicleScreen(),
  'select-driver': (context) =>  SelectDriverScreen.init(context),
  'layout': (context) => LayoutScreen.init(context),
  'edit-profile': (context) =>  EditProfile.init(context),
  'create-news': (context) => CreateNewsScreen.init(context),
  'chat': (context) => ChatScreen.init(context),
};