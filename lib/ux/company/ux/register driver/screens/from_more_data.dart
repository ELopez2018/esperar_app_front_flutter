import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/register_driver_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/dropdwown_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreData extends StatefulWidget {
  const MoreData({super.key});

  @override
  State<MoreData> createState() => _MoreDataState();
}

class _MoreDataState extends State<MoreData> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterDriverProvider>(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownCustom(
                    items: bloc.getSexo(),
                    label: 'Sexo',
                    onChanged: (value) => bloc.gender = value,
                  ),
                  DatePickerCustom(
                    label: 'Fecha de cumpleaños',
                    controller: bloc.birthdate,
                  ),
                  InputCustom(
                    label: 'Correo',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'usuario@gmail.com',
                    validator: validatedEmail,
                    controller: bloc.email,
                  ),
                  InputCustom(
                      label: 'Username',
                      icon: Icons.person,
                      textInputType: TextInputType.text,
                      hintText: 'Username',
                      validator: validateNotEmpty,
                      controller: bloc.username),
                  InputCustom(
                    label: 'Contraseña',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: '*******',
                    isPassword: true,
                    validator: validatedPassword,
                    controller: bloc.password,
                  ),
                  InputCustom(
                    label: 'Confirma contraseña',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: '*******',
                    isPassword: true,
                    controller: bloc.confirmPassword,
                    validator: (String? value) =>
                        validateEqualPassword(value, bloc.password.text),
                  ),
                  InputCustom(
                    label: 'Telefono',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: '666 6666',
                    validator: validatedPhone,
                    controller: bloc.phone,
                  ),
                  InputCustom(
                    label: 'Celular',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: '311 111 1111',
                    validator: validatedPhone,
                  ),
                  DatePickerCustom(
                    label: 'Fecha de Licencia ',
                    controller: bloc.licenseExpirationDate,
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonCustom(
                width: 100,
                text: 'Atras',
                onTap: () => bloc.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn)),
            ButtonCustom(
                text: 'Siguiente',
                onTap: () {
                  if (_formKey.currentState!.validate() &&
                      bloc.validateSelects()) {
                    bloc.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                })
          ],
        )
      ],
    );
  }
}
