import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_user_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_user_response_model.dart';
import 'package:esperar_app_front_flutter/data/services/options_service.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:flutter/material.dart';

class RegisterDriverProvider extends ChangeNotifier {
  RegisterDriverProvider(
      {required this.optionServices, required this.userService});
  PageController pageController = PageController();
  final List<String> sexoItems = ['Femenino', 'Masculino'];
  final List<String> nitOptionsItems = ['Cédula de ciudadanía', 'Pasaporte'];

  final OptionServices optionServices;
  final UserService userService;

  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();
  final TextEditingController documentType = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController password = TextEditingController();
    final TextEditingController licenseExpirationDate = TextEditingController();

  bool termsAndConditions = true;
  String? gender;
  String? country;
  String? state;
  String? city;

  Future init() async {}

  Future createUser() async {
    try {
     final response = await  userService.singUpUser(SingUpUserRequest(
        email: email.text,
        username: username.text,
        firstName: firstName.text,
        secondName: secondName.text,
        lastName: lastName.text,
        birthdate: birthdate.text,
        gender: gender!,
        documentNumber: documentNumber.text,
        documentType: 'CC',
        phone: phone.text,
        termsAndConditions: termsAndConditions,
        password: password.text,
        confirmPassword: confirmPassword.text,
        licenseExpirationDate: licenseExpirationDate.text,
      ));

      if(response != null){
        print(response);
      }
    } on String catch (_) {
      print(_);
    }
  }

  List<DropdownMenuItem<String>> getSexo() {
    return List.generate(
      sexoItems.length,
      (index) => DropdownMenuItem<String>(
        value: sexoItems[index],
        child: Text(
          sexoItems[index],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getNitOptions() {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem<String>(
        value: 'Elige una Pais',
        child: Text(
          'Elige un tipo de identificación',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ];

    items.addAll(
      nitOptionsItems.map((city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(
            city,
            style: const TextStyle(color: Colors.black),
          ),
        );
      }),
    );

    return items;
  }

  bool validateSelects() {
    if (gender != null && birthdate.text != '') {
      return true;
    }
    return false;
  }
}
