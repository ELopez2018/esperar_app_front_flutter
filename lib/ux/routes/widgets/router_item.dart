

import 'package:flutter/material.dart';

class RouteItem extends StatelessWidget {
  const RouteItem({
    super.key,
    required this.bottomPadding,
  });

  final double bottomPadding;

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
                      'Villavicencio',
                      style: textStyle,
                    ),
                    const Icon(Icons.arrow_forward),
                    Text(
                      'Restrepo',
                      style: textStyle,
                    )
                  ],
                ),
              ),
              const Text('Conductores en esta ruta 10')
            ],
          ),
        ),
      ),
    );
  }
}
