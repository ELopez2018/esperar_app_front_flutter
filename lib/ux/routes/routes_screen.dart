import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/routes/widgets/router_item.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarCustom(
          action: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HOLA',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'JUANITO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          title: Text(
            'RUTAS',
            style:  TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ButtonCustom(
                text: 'CREAR RUTA',
                onTap: () => push(context, 'new-route', null),
                width: 300,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, bottom: 15),
                  child: Text(
                    'Elegir tu ruta',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return RouteItem(
                      bottomPadding: index != 9 ? 10 : 0,
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
