import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/routes/company_routes.dart';
import 'package:esperar_app_front_flutter/core/routes/routes.dart';
import 'package:esperar_app_front_flutter/core/routes/vehicle_routes.dart';
import 'package:esperar_app_front_flutter/data/repository/local_storage_imple.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/chat_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/data/services/options_service.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/data/services/trafic_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/providers/pop_ups_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SocketService socketService = SocketService();

void main() async {
  await socketService.init('$apiHost/ws');
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
        ),
        Provider(
          create: (context) => socketService,
        )
      ],
      builder: (context, child) => MultiProvider(
        providers: [
          Provider(
            create: (context) => AuthService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => UserService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => VehicleService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => RouteService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => NewsService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => CompanyService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => TrafficService(),
          ),
          Provider(
            create: (context) => ChatService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false)),
          ),
          Provider(
            create: (context) => OptionServices(),
          ),
          ChangeNotifierProvider(
            create: (context) => PopUpsProvider(),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Esperar App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
            ),
            routes: {
              ...routes(context),
              ...vehicleRoutes(context),
              ...companyRoutes(context)
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
