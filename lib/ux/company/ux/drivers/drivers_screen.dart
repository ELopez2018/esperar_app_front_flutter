import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/drivers/drivers_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriversScreen extends StatefulWidget {
  const DriversScreen._();

  static Widget init() {
    return ChangeNotifierProvider(
      create: (context) => DriversProvider(
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false),
          userService: Provider.of<UserService>(context, listen: false))
        ..init(),
      builder: (context, child) => const DriversScreen._(),
    );
  }

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  @override
  void initState() {
    Provider.of<DriversProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DriversProvider>(context);
    return Column(
      children: [
        Expanded(
          child: bloc.drivers != null
              ? bloc.drivers!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final user = bloc.drivers![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.person , color: primaryColor,),
                                    SizedBox(width: 20),
                                    Text('${user!.fullName!}' , style: TextStyle(color: primaryColor),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: bloc.drivers!.length,
                      ),
                    )
                  : const Center(
                      child: Text(
                      'No se encontraron conductores',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ))
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ButtonCustom(
            text: 'Registrar un conductor',
            color: Colors.white,
            borderColor: Colors.white,
            background: primaryColor,
            onTap: () => push(context, 'register-driver', null),
          ),
        )
      ],
    );
  }
}
