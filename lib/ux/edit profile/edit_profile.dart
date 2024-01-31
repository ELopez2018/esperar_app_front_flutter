import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/data/services/vehicle_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/edit%20profile/edit_profile_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileProvider(
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false),
          userService: Provider.of<UserService>(context, listen: false))
        ..init(),
      builder: (context, child) => const EditProfile._(),
    );
  }

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
    final bloc = Provider.of<EditProfileProvider>(context);
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
                      const SizedBox(height: 10),
                      InputCustom(
                        label: 'Primer Nombre',
                        icon: Icons.person_2_rounded,
                        controller: bloc.firstName,
                        enable: false,
                      ),
                      InputCustom(
                        label: 'Segundo Nombre',
                        icon: Icons.person_2_rounded,
                        controller: bloc.secondName,
                        enable: false,
                      ),
                      InputCustom(
                        label: 'Apellidos',
                        icon: Icons.person_2_rounded,
                        controller: bloc.lastName,
                        enable: false,
                      ),
                      InputCustom(
                        label: 'Correo',
                        icon: Icons.email,
                        controller: bloc.email,
                      ),
                      InputCustom(
                        label: 'Telefono',
                        icon: Icons.phone,
                        controller: bloc.phone,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ButtonCustom(
                          text: 'ACTUALIZAR',
                          onTap: () async {
                            final result = await bloc.updateUser();
                            if(result != null && result){
                              pop(context, null);
                            }
                          },
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
