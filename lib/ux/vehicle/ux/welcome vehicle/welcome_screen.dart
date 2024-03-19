import 'package:flutter/material.dart';

class WelcomeVehicleScreen extends StatelessWidget {
  const WelcomeVehicleScreen({super.key});

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
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset('assets/icons/logo.png',
                      fit: BoxFit.cover, height: size.width * 0.3),
                      SizedBox(height: 70),
                      
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
