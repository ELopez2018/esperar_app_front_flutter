import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                      ButtonCustom(
                        text: 'Siguiente',
                        color: Colors.white,
                        borderColor: Colors.transparent,
                        background: const Color(0xFFf40d53),
                        onTap: () => pushReplacement(context, 'login', null),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
