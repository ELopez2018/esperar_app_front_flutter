import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/auth_service.dart';
import 'package:esperar_app_front_flutter/data/services/companies_service.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/login/login_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(
          authService: Provider.of<AuthService>(context, listen: false),
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false),
          userService: Provider.of<UserService>(context, listen: false),
          companyService: Provider.of<CompanyService>(context, listen: false)),
      builder: (context, child) => const LoginScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    final bloc = Provider.of<LoginProvider>(context);

    login() async {
      final result = await bloc.login();
      if (result != null) {
        if (result) {
          pushReplacement(context, 'select-driver', null);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: size.height - MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 260,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Image.asset(
                    'assets/images/logo-login.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                InputCustom(
                                  label: 'PLACA',
                                  image: "assets/icons/placa.png",
                                  controller: bloc.plate,
                                ),
                                const SizedBox(height: 20),
                                InputCustom(
                                  label: 'PIN',
                                  image: "assets/icons/pin.png",
                                  controller: bloc.password,
                                  isPassword: true,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            ButtonCustom(
                              text: "INICIAR SESIÓN",
                              onTap: login,
                              color: Colors.white,
                              borderColor: Colors.transparent,
                              background: Color(0xFFf40d53),
                            ),
                            const SizedBox(height: 20),
                            const Text("Olvide mi contraseña",
                                style: textStyle),
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
