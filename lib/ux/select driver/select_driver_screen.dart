import 'package:esperar_app_front_flutter/core/const/generate_vehicle_plate.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/select%20driver/select_driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectDriverScreen extends StatelessWidget {
  const SelectDriverScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectDiverProvider(
        localStorageInterface: Provider.of<LocalStorageInterface>(context,listen: false),
        userService: Provider.of<UserService>(context,listen: false),
      )..init(),
      builder: (context, child) => const SelectDriverScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SelectDiverProvider>(context);
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:  bloc.getVehicle() != null ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Bienvenido ${bloc.getVehicle()!.brand}",
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
                             PlateVehicle(
                                plate: bloc.getVehicle()!.licensePlate, background: Colors.yellow),
                            const SizedBox(width: 20),
                            PlateVehicle(
                                number: int.parse(bloc.getVehicle()!.secondaryPlate!), background: Colors.grey[200]!),
                          ],
                        ),
                        const SizedBox(height: 5),
                         Text(
                          "${bloc.getVehicle()!.model} - ${bloc.getVehicle()!.color} ${bloc.getVehicle()!.year}",
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
                            return GestureDetector(
                              onTap:bloc.setSelectUser,
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black)),
                                  ),
                                   Text(bloc.users[index].firstName ?? 'Admin' , style: TextStyle(color: bloc.selectUser ? Colors.green : Colors.black , fontWeight: bloc.selectUser ? FontWeight.bold : FontWeight.normal )),
                                   Text(bloc.users[index].documentNumber != null ? bloc.users[index].documentNumber.toString() : '1234')
                                ],
                              ),
                            );
                          },
                          itemCount: bloc.users.length,
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
                child: GestureDetector(
                  onTap: () => pushReplacement(context, 'layout', null),
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
          ) : Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
