

import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:flutter/material.dart';

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
                    Text(
                      route.from!,
                      style: textStyle,
                    ),
                    const Icon(Icons.arrow_forward),
                    Text(
                      route.to!,
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const Text('Conductores en esta ruta 0')
            ],
          ),
        ),
      ),
    );
  }
}
