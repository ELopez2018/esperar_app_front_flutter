import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/services/route_service.dart';
import 'package:esperar_app_front_flutter/data/services/trafic_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/routes/routes_provider.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/routes/widgets/router_item.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoutesProvider(
        routeService: Provider.of<RouteService>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
        trafficService: Provider.of<TrafficService>(context, listen: false),
      )..init(),
      builder: (context, child) => const RoutesScreen._(),
    );
  }

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  void initState() {
    final bloc = Provider.of<RoutesProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RoutesProvider>(context);

    return Column(
      children: [
        AppBarCustom(
          action: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HOLA',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: bloc.user != null
                    ? Text(
                        bloc.user!.firstName != null
                            ? bloc.user!.firstName!
                            : 'Admin',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : SizedBox(),
              )
            ],
          ),
          title: const Text(
            'RUTAS',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ButtonCustom(
                text: 'CREAR RUTA',
                color: Colors.white,
                borderColor: Colors.transparent,
                background: const Color(0xFFf40d53),
                onTap: () async {
                  final result =
                      await push(context, 'new-route', null) as RouteModel?;
                  if (result != null) {
                    bloc.addRoute(result);
                  }
                },
                width: 300,
              ),
              bloc.routes != null
                  ? bloc.routes!.isNotEmpty
                      ? Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30, left: 10, bottom: 15),
                                  child: Text(
                                    'Elegir tu ruta',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return RouteItem(
                                      bottomPadding: index != 9 ? 10 : 0,
                                      route: bloc.routes![index]!,
                                    );
                                  },
                                  itemCount: bloc.routes!.length,
                                ),
                                
                              ),
                            ],
                          ),
                        )
                      : const Expanded(
                          child: Center(
                            child: Text('No hay rutas registradas'),
                          ),
                        )
                  : const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
