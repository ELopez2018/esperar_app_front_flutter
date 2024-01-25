import 'package:esperar_app_front_flutter/core/const/generate_vehicle_plate.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<DropdownMenuItem<String>> items = [
      DropdownMenuItem<String>(
        value: 'a',
        child: Text(
          'ACTIVO',
          style: TextStyle(color: Colors.green),
        ),
      ),
      DropdownMenuItem<String>(
        value: 'b',
        child: Text(
          'INACTIVO',
          style: TextStyle(color: Colors.red),
        ),
      )
    ];
    String driverState = items[0].value!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 AppBarCustom(
                  title: const Text(
                    'MI PERFIL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  suffixWidget: Align(
                      alignment: Alignment.center,
                      child: GestureDetector( onTap: () => pushReplacement(context, 'login', null),
                        child: const Text(
                          'Cerrar sesión',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 15,
                                          left: 0,
                                          right: 0,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 1.5,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'Cambiar foto',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text('Foto')
                              ],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () =>
                                          push(context, 'edit-profile', null),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.orange,
                                        width: 70,
                                        height: 20,
                                        child: const Text(
                                          'EDITAR DATOS',
                                          style: TextStyle(
                                              fontSize: 9, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const PlateVehicle(
                                          plate: 'DML 040',
                                          background: Colors.yellow),
                                      const SizedBox(width: 20),
                                      PlateVehicle(
                                          number: 238,
                                          background: Colors.grey[200]!),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "VOLVO - BLANCA 2000",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 180,
                                    child: DropdownButtonFormField<String>(
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
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "REGISTRO DE RUTAS HECHAS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const DatePickerCustom(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("25-07-2020 8:00am"),
                                        const PlateVehicle(
                                          background: Colors.yellow,
                                          plate: 'VILLAVICE - RESTRE',
                                          width: 110,
                                          fontSize: 8,
                                        ),
                                        Text(
                                          "JUANITOS PEREZ $index",
                                          style: const TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 1,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerCustom> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return Container(
      color: Colors.white,
      width: 200,
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: formattedDate,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            prefixIcon: const Icon(Icons.calendar_month_rounded),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(0),
            )),
        readOnly: true,
        onTap: _selectDate,
        controller: controller,
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now());

    if (picked != null) {
      setState(() {
        controller.text = picked.toString().split(" ")[0];
      });
    }
  }
}
