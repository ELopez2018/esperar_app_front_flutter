import 'dart:io';

import 'package:esperar_app_front_flutter/data/models/auth/sing_up_company_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CompanyProvider extends ChangeNotifier {
  CompanyProvider({
    required this.userService,
  });

  bool personalInformation = true;
  PageController pageController = PageController();
  String? filePath;
  FileType? fileType;
  final UserService userService;
  final List<String> countryItems = ['c', 'a'];
  bool errorSelect = false;

  TextEditingController name = TextEditingController();
  TextEditingController nit = TextEditingController();
  TextEditingController legalRepresentativeId = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController neighborhood = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cellPhone = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? country;
  String? department;
  String? city;

  bool termsAndConditions = false;
  String? error;

  void setPersonalInformation() {
    personalInformation = !personalInformation;
    notifyListeners();
  }

  void setFile(String value) {
    filePath = value;
    notifyListeners();
  }

  uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      filePath = result.files.single.path;
      fileType = result.files.single.extension == 'pdf'
          ? FileType.custom
          : FileType.image;
      setError(false);
    }
    notifyListeners();
  }

  void removeFile() {
    filePath = null;
    fileType = null;
    notifyListeners();
  }

  List<DropdownMenuItem<String>> getCountry() {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem<String>(
        value: 'Elige una Pais',
        child: Text(
          'Elige una Pais',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ];

    items.addAll(
      countryItems.map((city) {
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

  List<DropdownMenuItem<String>> getDepartment() {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem<String>(
        value: 'Elige un departamento',
        child: Text(
          'Elige un departamento',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ];

    items.addAll(
      countryItems.map((city) {
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

  List<DropdownMenuItem<String>> getCity() {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem<String>(
        value: 'Elige una ciudad',
        child: Text(
          'Elige una ciudad',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ];

    items.addAll(
      countryItems.map((city) {
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

  Future<bool?>? createCompany() async {
    try {
      final response = await userService.singUpCompany(
        SingUpCompanyRequest(
          name: name.text,
          nit: nit.text,
          legalRepresentativeId: 0,
          address: address.text,
          email: email.text,
          neighborhood: neighborhood.text,
          city: city!,
          department: department!,
          country: country!,
          phone: phone.text,
          cellPhone: cellPhone.text,
          whatsapp: whatsapp.text,
          username: username.text,
          password: password.text,
          confirmPassword: confirmPassword.text,
          termsAndConditions: termsAndConditions,
        ),
      );
      if (response != null) {
        return true;
      }
      return false;
    } on String catch (err) {
      error = err;
    }
    return null;
  }

  void onChangeCountry(String? value) {
    country = value;
  }

  void onChangeDepartment(String? value) {
    department = value;
  }

  void onChangeCity(String? value) {
    city = value;
  }

  void onChangeTermsAndConditions(bool? value) {
    termsAndConditions = value!;
    notifyListeners();
  }

  void setError(bool value) {
    errorSelect = value;
    notifyListeners();
  }

  bool validateSelectsForm2() {
    if (country != null && country!.isNotEmpty) {
      if (department != null && department!.isNotEmpty) {
        if (city != null && city!.isNotEmpty) {
          return true;
        }
      }
    }
    return false;
  }
}
