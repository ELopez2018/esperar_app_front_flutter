import 'package:esperar_app_front_flutter/core/routes/routes.dart';
import 'package:esperar_app_front_flutter/data/repository/local_storage_imple.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorageInterface>(
          create: (context) => LocalStorageImplementation(),
        )
      ],
      builder: (context, child) => MultiProvider(
        providers: [
          Provider(
            create: (context) => AuthService(),
          ),
          Provider(
            create: (context) => UserService(),
          ),
          Provider(
            create: (context) => VehicleService(),
          ),
          Provider(
            create: (context) => RouteService(),
          ),
          Provider(
            create: (context) => NewsService(),
          ),
          Provider(
            create: (context) => CompanyService(),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Esperar App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: routes(context),
            initialRoute: 'splash',
          );
        },
      ),
    );
  }
}
