import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateRouteScreen extends StatelessWidget {
  const CreateRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(
                  label: 'RUTAS',
                  action: GestureDetector(
                    onTap: () => pop(context, null),
                    child: const Icon(Icons.arrow_back),
                  )),
              const Text('Crear ruta:'),
              const SizedBox(height: 20),
              const InputCustom(label: 'Desde'),
              const SizedBox(height: 20),
              const InputCustom(label: 'Hasta'),
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.center,
                  child: ButtonCustom(
                    text: 'INICIAR',
                    onTap: () {},
                    width: 200,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
