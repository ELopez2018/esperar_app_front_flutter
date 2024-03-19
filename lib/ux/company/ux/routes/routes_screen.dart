import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/routes/routes_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutesCompanyScreen extends StatefulWidget {
  const RoutesCompanyScreen._();

  static Widget init(BuildContext context ) {
    return ChangeNotifierProvider(
      create: (context) => RoutesCompanyProvider(
        routeService: Provider.of<RouteService>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
      )..init(),
      builder: (context, child) => const RoutesCompanyScreen._(),
    );
  }

  @override
  State<RoutesCompanyScreen> createState() => _RoutesCompanyScreenState();
}

class _RoutesCompanyScreenState extends State<RoutesCompanyScreen> {
  @override
  void initState() {
    final bloc = Provider.of<RoutesCompanyProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RoutesCompanyProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: bloc.routes != null
              ? bloc.routes!.isEmpty
                  ? const Center(
                      child: Text(
                      'No se encontraron rutas',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final route = bloc.routes![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(5)),
                            height: 130,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        route!.name!,
                                        style: const TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: IndicatorRoute(
                                                text: route.from!,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: IndicatorRoute(
                                                text: route.to!,
                                                endRoute: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                       Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.car_crash_sharp,
                                                color: primaryColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text('10')
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Ver en el mapa'),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons.map,
                                                    color: primaryColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () => push(context, 'detail-company-route', route),
                                                child: Row(
                                                  children: [
                                                    Text('Detalle de la ruta'),
                                                    SizedBox(width: 5),
                                                    Icon(
                                                      Icons.route,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: bloc.routes!.length,
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ButtonCustom(
            text: 'Crear una ruta',
            color: Colors.white,
            borderColor: Colors.white,
            background: primaryColor,
            onTap: () => push(context, 'create-route', null),
          ),
        )
      ],
    );
  }
}
