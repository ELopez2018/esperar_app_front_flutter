import 'package:csc_picker/csc_picker.dart';
import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/register_driver_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormLocationUser extends StatefulWidget {
  const FormLocationUser({super.key});

  @override
  State<FormLocationUser> createState() => _FormLocationUserState();
}

class _FormLocationUserState extends State<FormLocationUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterDriverProvider>(context);

createUser() async {
  final result = await bloc.createUser();
}

    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ubicacion",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                CSCPicker(
                  onCountryChanged: (value) => bloc.country = value,
                  onStateChanged: (value) => bloc.state = value,
                  onCityChanged: (value) => bloc.city = value,
                  layout: Layout.vertical,
                  countryDropdownLabel: 'Selecciona un país',
                  stateDropdownLabel: 'Selecciona un departamento',
                  cityDropdownLabel: 'Selecciona un municipio',
                  dropdownDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  disabledDropdownDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        )),
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
                text: 'Rgistrar usuario',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                   createUser();
                  }
                })
          ],
        )
      ],
    );
  }
}
