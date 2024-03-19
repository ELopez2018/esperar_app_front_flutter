import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/register_driver_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/dropdwown_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPersonalInformationUser extends StatefulWidget {
  const FormPersonalInformationUser({
    super.key,
  });

  @override
  State<FormPersonalInformationUser> createState() =>
      _FormPersonalInformationUserState();
}

class _FormPersonalInformationUserState
    extends State<FormPersonalInformationUser> {
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
                  InputCustom(
                    label: 'Nombre',
                    icon: Icons.person_2,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'Antonio',
                    validator: validateNotEmpty,
                    controller: bloc.firstName,
                  ),
                  InputCustom(
                    label: 'Segundo Nombre',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'Jose',
                    validator: validateNotEmpty,
                    controller: bloc.secondName,
                  ),
                   InputCustom(
                    label: 'Apellidos',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'Velez',
                    validator: validateNotEmpty,
                    controller: bloc.lastName,
                  ),
                  DropdownCustom(label: 'Tipo de identificacion', items: bloc.getNitOptions(), onChanged: (value) {
                    bloc.documentType.text = value!;
                  },),
                  InputCustom(
                    label: 'DNI',
                    icon: Icons.directions,
                    textInputType: TextInputType.streetAddress,
                    hintText: 'DNI',
                    validator: validateNumericString,
                    controller: bloc.documentNumber,
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
