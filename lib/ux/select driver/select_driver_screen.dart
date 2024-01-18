import 'package:esperar_app_front_flutter/core/const/generate_vehicle_plate.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:flutter/material.dart';

class SelectDriverScreen extends StatelessWidget {
  const SelectDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bienvenido, DML 040",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () => pop(context, null),
                              child: const Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                pushNamedAndRemoveUntil(context, 'login');
                              },
                              child: const Text("Aceptar"),
                            ),
                          ],
                          title: const Text(
                            "Deseas regresar al inicio de sesión",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const PlateVehicle(
                                plate: 'DML 040', background: Colors.yellow),
                            const SizedBox(width: 20),
                            PlateVehicle(
                                number: 238, background: Colors.grey[200]!),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "VOLVO - BLANCA 2000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "¿QUIEN CONDUCE AHORA?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Nombre o cc',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5)),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 100,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                ),
                                const Text("Nombre"),
                                const Text("cc")
                              ],
                            );
                          },
                          itemCount: 9,
                          physics: const BouncingScrollPhysics(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Siguiente"),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: const Text("POLÍTICA DE PRIVACIDAD",
                          style: textStyle)),
                  GestureDetector(
                    child: const Text("SOPORTE", style: textStyle),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
