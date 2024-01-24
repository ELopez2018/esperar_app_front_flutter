import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = List.generate(
        10,
        (index) => DropdownMenuItem<String>(
              value: 'empresa $index',
              child: Text(
                'empresa $index',
                style: const TextStyle(),
              ),
            ));

    String driverState = items[0].value!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCustom(
              title: Text(
                'EDITAR MIS DATOS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              action: ButtonBackScreen(),
              suffixWidget: SizedBox(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('EMPRESA'),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              items: items,
                              onChanged: (String? value) {
                                driverState = value!;
                              },
                              value: driverState,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const InputCustom(
                        label: 'PLACA',
                        image: "assets/icons/placa.png",
                      ),
                      const InputCustom(label: 'NUMERO DE VEHÍCULO'),
                      const InputCustom(label: 'AÑO DEL VEHÍCULO'),
                      const InputCustom(label: 'MARCAR DEL VEHÍCULO'),
                      const InputCustom(label: 'SERIE'),
                      const InputCustom(label: 'NUMERO CELULAR'),
                      const InputCustom(
                        label: 'CLAVE',
                        image: "assets/icons/pin.png",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ButtonCustom(
                          text: 'ACTUALIZAR',
                          onTap: () {},
                          background: Colors.green,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
