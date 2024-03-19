import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/providers/pop_ups_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopUps extends StatelessWidget {
  const PopUps({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PopUpsProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        if (bloc.getCloseSession()) const LogoutPopup(),
      ],
    );
  }
}

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        Positioned(
          top: size.height / 2 - 70,
          left:
              size.width / 2 - (size.width < 400 ? size.width * 0.8 / 2 : 150),
          height: 140,
          child: Container(
            width: size.width < 400 ? size.width * 0.8 : 150,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 0.5,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Deseas cerra la sesión',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonCustom(
                      text: 'Cancela',
                      color: primaryColor,
                      borderColor: primaryColor,
                      width:
                          (size.width < 400 ? size.width * 0.8 : 150) / 2 - 30,
                      onTap: () =>
                          Provider.of<PopUpsProvider>(context, listen: false)
                              .setCloseSession(),
                    ),
                    ButtonCustom(
                      text: 'Aceptar',
                      color: Colors.white,
                      background: primaryColor,
                      borderColor: primaryColor,
                      width:
                          (size.width < 400 ? size.width * 0.8 : 150) / 2 - 30,
                      onTap: () async {
                        final String? accessToken =
                            await Provider.of<LocalStorageInterface>(context,
                                    listen: false)
                                .getAccessToken();
                        final logoutResponse = await Provider.of<AuthService>(
                                context,
                                listen: false)
                            .logout(accessToken!);
                        if (logoutResponse != null && logoutResponse) {
                          Provider.of<PopUpsProvider>(context, listen: false)
                              .setCloseSession();
                          Provider.of<LocalStorageInterface>(context,
                                  listen: false)
                              .clean()
                              .whenComplete(
                                () => pushReplacement(
                                  context,
                                  'welcome',
                                  null,
                                ),
                              );
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
