

import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/layout/layout_provider.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/routes/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class RouteItem extends StatelessWidget {
  const RouteItem({
    super.key,
    required this.bottomPadding,
    required this.route,
  });

  final double bottomPadding;
  final RouteModel route;

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontWeight: FontWeight.w700);
        final bloc = Provider.of<RoutesProvider>(context);


    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: bottomPadding),
      child: Container(
        height: 80,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        route.from!,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.arrow_forward),
                    Expanded(
                      child: Text(
                        route.to!,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Conductores en esta ruta 0'),
                  GestureDetector( onTap: () async  {
                      Provider.of<LayoutProvider>(context,listen: false).addPolilyne(route.coordinates!.map((e) => LatLng(double.parse(e!.latitude), double.parse(e.longitude))).toList());
                      Provider.of<LayoutProvider>(context,listen: false).route = route;
                       Provider.of<LayoutProvider>(context,listen: false).setPage(2);
                      
                    
                  }, child: Text('Iniciar ruta'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
