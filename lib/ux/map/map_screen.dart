import 'package:esperar_app_front_flutter/ux/map/widgets/indicator_route.dart';
import 'package:esperar_app_front_flutter/ux/map/widgets/vehicle_indicator_route.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarCustom(label: 'MAPA'),
        
        Expanded(
          child: Stack(
            children: [
              const Positioned.fill(
                child: Center(
                  child:  Text(
                    'Mapa',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: [
                    const Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                        children: [
                          IndicatorRoute(text: 'Villavicencio'),
                          SizedBox(height: 10),
                          IndicatorRoute(text: 'Restrepo', endRoute: true),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ButtonCustom(
                            text: 'Finalizar ruta',
                            color: Colors.white,
                            background: Colors.red,
                            width: 120,
                            onTap: () {},
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 120,
                              maxWidth: 210,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: const Icon(
                                          Icons.arrow_upward_outlined),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: const Icon(
                                          Icons.arrow_downward_outlined),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: SizedBox(
                                    height: 180,
                                    child: Column(
                                      children: [
                                        const VehicleIndicatorRoute(
                                          vehiclesAhead: true,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Container(
                                            height: 10,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const VehicleIndicatorRoute(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
