import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/core/forms/validators.dart';
import 'package:esperar_app_front_flutter/ux/auth/create%20account/company_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/input_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/view_image.dart';
import 'package:esperar_app_front_flutter/ux/widgets/view_pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';

class Form3Screen extends StatefulWidget {
  const Form3Screen({
    super.key,
  });

  @override
  State<Form3Screen> createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<Form3Screen> {
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
                const Text(
                  "Mas datos personales",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                InputCustom(
                  label: 'telefono',
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  hintText: '666 666 666',
                  validator: validatedPhone,
                ),
                InputCustom(
                  label: 'Celular',
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  hintText: '311 111 1111',
                  validator: validatedPhone,
                ),
                InputCustom(
                  label: 'Whasap',
                  icon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                  hintText: '311 111 1111',
                  validator: validatedPhone,
                ),
                Text('Camara y Comercio'),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: bloc.filePath == null ? bloc.uploadFile : null,
                  child: DottedBorder(
                    color: Colors.red,
                    dashPattern: [10],
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      alignment: Alignment.center,
                      child: bloc.filePath == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subir Camara y comercio'),
                                if (bloc.errorSelect)
                                  Text(
                                    'Este archivo es requerido',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                              ],
                            )
                          : Stack(
                              children: [
                                Positioned.fill(
                                  child: bloc.fileType == FileType.image
                                      ? Image.file(File(bloc.filePath!))
                                      : Stack(
                                          children: [
                                            Positioned.fill(
                                              child: PDFView(
                                                filePath: bloc.filePath!,
                                                enableSwipe: false,
                                                swipeHorizontal: false,
                                                autoSpacing: true,
                                                pageFling: false,
                                                onError: (error) {},
                                                onPageError: (page, error) {},
                                              ),
                                            ),
                                            Positioned.fill(
                                                child: Container(
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ))
                                          ],
                                        ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: bloc.removeFile,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: GestureDetector(
                                    onTap: () => bloc.fileType ==
                                            FileType.custom
                                        ? pushPage(context,
                                            ViewPdf(filePath: bloc.filePath!))
                                        : pushPage(
                                            context,
                                            ViewImage(
                                              filePath: bloc.filePath!,
                                            )),
                                    child: Container(
                                      child: Icon(
                                        Icons.fullscreen,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Aceptar terminos y condiciones'),
                    Checkbox(
                      value: bloc.termsAndConditions,
                      onChanged: bloc.onChangeTermsAndConditions,
                    ),
                  ],
                )
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
              text: 'Registrar empresa',
              onTap: () async {
                if (_formKey.currentState!.validate() &&
                    bloc.filePath != null) {
                  final result = await bloc.createCompany();
                  if (result != null) {
                    const snackBar = SnackBar(
                      content: Text(
                        'La cuenta se ha creado!.....redireccionando',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: primaryColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Future.delayed(Duration(seconds: 3), () {
                      pushReplacement(context, 'login', null);
                    });
                  } else {
                    if (bloc.error != null) {
                      final snackBar = SnackBar(
                        content: Text(bloc.error!),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                } else if (bloc.filePath == null) {
                  bloc.setError(true);
                }
              },
            )
          ],
        )
      ],
    );
  }
}
