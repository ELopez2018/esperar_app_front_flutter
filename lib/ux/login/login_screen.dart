import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const textStyle = TextStyle(fontWeight: FontWeight.bold);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: size.height - MediaQuery.of(context).padding.top,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("INICIAR SESIÓN",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Column(
                        children: [
                          InputCustom(
                            label: 'PLACA',
                            image: "assets/icons/placa.png",
                          ),
                          SizedBox(height: 20),
                          InputCustom(
                            label: 'PIN',
                            image: "assets/icons/pin.png",
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: 200, maxWidth: 200),
                        child: GestureDetector(
                          onTap: () =>
                              pushReplacement(context, 'select-driver', null),
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: const Text("INICIAR SESIÓN"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Olvide mi contraseña", style: textStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: const Text("POLÍTICA DE PRIVACIDAD",
                              style: textStyle)),
                      GestureDetector(
                          child: const Text("SOPORTE", style: textStyle)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
