// ignore_for_file: use_build_context_synchronously

import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/auth/login/login_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(
          authService: Provider.of<AuthService>(context, listen: false),
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false),
          userService: Provider.of<UserService>(context, listen: false),
          companyService: Provider.of<CompanyService>(context, listen: false),
          vehicleService: Provider.of<VehicleService>(context, listen: false)),
      builder: (context, child) => const LoginScreen._(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginProvider>(context);
    final Size size = MediaQuery.of(context).size;

    login() async {
      if (_formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        final result = await bloc.login();
        if (result != null && result) {
          loginRol(context, bloc.rol!);
        } else if (bloc.error != null) {
          final snackBar = SnackBar(
            content: Text(bloc.error ?? 'error'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputCustom(
                          label: 'Usuario',
                          controller: bloc.user,
                          validator: validateNotEmpty,
                        ),
                        InputCustom(
                          label: 'Contraseña',
                          controller: bloc.password,
                          validator: validatedPassword,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => bloc.setShowRecoverPassword(),
                            child: const Text(
                              'Olvidar contraseña',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: ButtonCustom(
                            text: 'Iniciar sesión',
                            color: Colors.white,
                            onTap: login,
                            background: primaryColor,
                            width: size.width,
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('o inicie session con'),
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                              ),
                              child: Image.asset('assets/icons/google.png'),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(5),
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
              ),
            ),
            if (bloc.state == StateProgress.loading)
              const ProgressIndicatorCustom(),
            const Positioned(left: 20, top: 20, child: ButtonBackScreen()),
            if (bloc.getShowRecoverPassword())
              GenerateCode.init(context, bloc.setShowRecoverPassword)
          ],
        ),
      ),
    );
  }
}
