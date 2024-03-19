import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/data/services/user_service.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/company_provider.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/screens/form_1.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/screens/form_2.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/screens/form_3.dart';
import 'package:esperar_app_front_flutter/ux/widgets/dropdwown_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/view_image.dart';
import 'package:esperar_app_front_flutter/ux/widgets/view_pdf.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';

class RegisterCompanyScreen extends StatelessWidget {
  const RegisterCompanyScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompanyProvider(
          userService: Provider.of<UserService>(context, listen: false)),
      builder: (context, child) => const RegisterCompanyScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CompanyProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Registrar una empresa",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: PageView(
                children: [
                  Form1Screen(),
                  Form2Screen(),
                  Form3Screen()
                ],
                controller: bloc.pageController,
                physics: const NeverScrollableScrollPhysics(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
