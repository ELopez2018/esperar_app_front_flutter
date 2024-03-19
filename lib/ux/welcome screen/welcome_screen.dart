import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/welcome%20screen/welcome_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeProvider(),
      builder: (context, child) => const WelcomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = Provider.of<WelcomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/images/splash-f.png',
              fit: BoxFit.cover,
              height: size.height,
            )),
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.5),
            )),
            Positioned.fill(
              child: SafeArea(
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/logo.png',
                                fit: BoxFit.cover, height: size.width * 0.3),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Podrás realizar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Ver mapas con compañeros en el camino\nEstar enterado de las noticias de tu empresa\nVer tu programación de rutas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ButtonCustom(
                                  text: 'Iniciar Sesion',
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  background: const Color(0xFFf40d53),
                                  onTap: () => push(context, 'login', null),
                                ),
                                const SizedBox(height: 20),
                                ButtonCustom(
                                  text: 'Registrar',
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  background: const Color(0xFFf40d53),
                                  onTap: () => bloc.setShowRegisterMenu(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (bloc.getShowRegisterMenu())
                        const CreateAccountOption(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountOption extends StatelessWidget {
  const CreateAccountOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WelcomeProvider>(context);
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          height: 250,
          bottom: 0,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () => bloc.setShowRegisterMenu(),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ButtonCustom(
                    text: 'Crear cuenta',
                    color: Colors.white,
                    onTap: () {
                      bloc.setShowRegisterMenu();
                      push(context, 'register-company', null);
                    },
                    background: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: primaryColor,
                          height: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('o registrese con'),
                      ),
                      Expanded(
                        child: Container(
                          color: primaryColor,
                          height: 2,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                        ),
                      ),
                      child: Image.asset('assets/icons/google.png'),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                        ),
                      ),
                      child: Image.asset('assets/icons/microsoft.png'),
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
