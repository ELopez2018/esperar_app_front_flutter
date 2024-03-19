import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/company_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/input_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Form1Screen extends StatefulWidget {
  const Form1Screen({
    super.key,
  });

  @override
  State<Form1Screen> createState() => _Form1State();
}

class _Form1State extends State<Form1Screen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CompanyProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Datos personales",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  InputCustom(
                    label: 'Razon Social',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'empresa',
                    controller: bloc.name,
                    validator: validateAlphabeticText,
                  ),
                  InputCustom(
                    label: 'Nit',
                    icon: Icons.email,
                    textInputType: TextInputType.number,
                    hintText: '111111111',
                    controller: bloc.nit,
                    validator: validateNumericString,
                  ),
                  const InputCustom(
                    label: 'Representante',
                    icon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'antonio velez',
                  ),
                  InputCustom(
                      label: 'Correo',
                      icon: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'empresa@gmail.com',
                      controller: bloc.email,
                      validator: validatedEmail),
                  InputCustom(
                      label: 'Usuario',
                      icon: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Usuario',
                      controller: bloc.username,
                      validator: validateNotEmpty),
                  InputCustom(
                    label: 'Contraseña',
                    icon: Icons.password,
                    textInputType: TextInputType.text,
                    hintText: '********',
                    controller: bloc.password,
                    validator: validatedPassword,
                    isPassword: true,
                  ),
                  InputCustom(
                    label: 'Verificar Contraseña',
                    icon: Icons.password,
                    textInputType: TextInputType.text,
                    hintText: '********',
                    controller: bloc.confirmPassword,
                    validator: (String? value) => validateEqualPassword(value, bloc.password.text),
                    isPassword: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ButtonCustom(
            text: 'Siguiente',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                bloc.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
            },
          ),
        )
      ],
    );
  }
}
