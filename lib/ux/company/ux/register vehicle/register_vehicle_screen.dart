import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20vehicle/register_vehicle_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/date_picker.dart';
import 'package:esperar_app_front_flutter/ux/widgets/dropdwown_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/input_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterVehicleScreen extends StatefulWidget {
  const RegisterVehicleScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterVehicleProvider(
          vehicleService: Provider.of<VehicleService>(context, listen: false),
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false),
          userService: Provider.of<UserService>(context, listen: false))
        ..init(),
      builder: (context, child) => RegisterVehicleScreen._(),
    );
  }

  @override
  State<RegisterVehicleScreen> createState() => _RegisterVehicleScreenState();
}

class _RegisterVehicleScreenState extends State<RegisterVehicleScreen> {
  @override
  void initState() {
    Provider.of<RegisterVehicleProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterVehicleProvider>(context);
    ;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              InputCustom(label: 'Placa'),
              InputCustom(label: 'Placa Secundaria'),
              InputCustom(label: 'Marca'),
              InputCustom(label: 'Modelo'),
              InputCustom(label: 'Color'),
              InputCustom(label: 'Año'),
              DropdownCustom(
                label: 'Conductores',
                items: bloc.drivers != null ? bloc.getDrives() : [],
              ),
              InputCustom(label: 'Cilindraje'),
              InputCustom(label: 'Capacidad'),
              DatePickerCustom(
                label: 'Expiracion del soat',
                controller: bloc.soatExpirationDate,
              ),
              DatePickerCustom(
                label: 'Expiracion de la tecnomecanica',
                controller: bloc.tecnoMechanicalExpirationDate,
              ),
              const SizedBox(height: 20),
              ButtonCustom(
                text: 'Registrar vehiculo',
                color: Colors.white,
                borderColor: Colors.white,
                background: primaryColor,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
