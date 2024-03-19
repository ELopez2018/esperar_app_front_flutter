import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:flutter/material.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: 0 == 0
                ? const Center(
                    child: Text(
                      'No se encuentran vehículos registrados',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: 0,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ButtonCustom(
              text: 'Registrar un vehículo',
              color: Colors.white,
              borderColor: Colors.white,
              background: primaryColor,
              onTap: () => push(context, 'register-vehicle', null),
            ),
          )
        ],
      ),
    );
  }
}
