import 'package:esperar_app_front_flutter/core/const/generate_vehicle_plate.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/profile/profile_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/date_picker.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
      )..init(),
      builder: (context, child) => const ProfileScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProfileProvider>(context);
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
                      child: GestureDetector(
                        onTap: () async  {
                          await Provider.of
                          <LocalStorageInterface>(context,listen: false).clean();
                          pushReplacement(context, 'login', null);
                        },
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
                              child: bloc.getVehicle() != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () => push(
                                                context, 'edit-profile', null),
                                            child: Container(
                                              alignment: Alignment.center,
                                              color: Colors.orange,
                                              width: 70,
                                              height: 20,
                                              child: const Text(
                                                'EDITAR DATOS',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            PlateVehicle(
                                                plate: bloc
                                                    .getVehicle()!
                                                    .licensePlate,
                                                background: Colors.yellow),
                                            const SizedBox(width: 20),
                                            PlateVehicle(
                                                number: int.parse(bloc
                                                    .getVehicle()!
                                                    .secondaryPlate!),
                                                background: Colors.grey[200]!),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${bloc.getVehicle()!.brand} - ${bloc.getVehicle()!.color} ${bloc.getVehicle()!.year}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: 180,
                                          child:
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
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : const CircularProgressIndicator(),
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
                         DatePickerCustom(width: 200, controller: TextEditingController(),),
                        const SizedBox(height: 20),
                        Expanded(
                          child: 0 > 0
                              ? ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                style: const TextStyle(
                                                    fontSize: 12),
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
                                  itemCount: 0,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                          'No se encuentran rutas registradas'),
                                    ),
                                    SizedBox(height: 10),
                                    Icon(
                                      Icons.not_interested_rounded,
                                      color: Colors.grey,
                                    )
                                  ],
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

