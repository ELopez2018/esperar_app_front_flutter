import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/company_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/dropdwown_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/input_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Form2Screen extends StatefulWidget {
  const Form2Screen({
    super.key,
  });

  @override
  State<Form2Screen> createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CompanyProvider>(context);

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
                InputCustom(
                  label: 'Dirrecion',
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'cl 9 a sur 12 a 28 z',
                  controller: bloc.address,
                  validator: validateNotEmpty,
                ),
                DropdownCustom(
                  items: bloc.getCountry(),
                  label: 'Pais',
                  onChanged: bloc.onChangeCountry,
                ),
                DropdownCustom(
                  items: bloc.getDepartment(),
                  label: 'Departamento',
                  onChanged: bloc.onChangeDepartment,
                ),
                DropdownCustom(
                  items: bloc.getCity(),
                  label: 'Ciudad',
                  onChanged: bloc.onChangeCity,
                ),
                InputCustom(
                  label: 'Barrio',
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'centro',
                  validator: validateAlphabeticText,
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
                text: 'Siguiente',
                onTap: () {
                  if (_formKey.currentState!.validate() && bloc.validateSelectsForm2()) {
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
