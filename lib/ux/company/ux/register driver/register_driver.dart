import 'package:esperar_app_front_flutter/data/services/options_service.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/register_driver_provider.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/screens/form_personal_information.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/screens/form_ubication.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/register%20driver/screens/from_more_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterDriverScreen extends StatefulWidget {
  const RegisterDriverScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterDriverProvider(
        optionServices: Provider.of<OptionServices>(context, listen: false),
        userService: Provider.of<UserService>(context,listen: false)
      )..init(),
      builder: (context, child) => const RegisterDriverScreen._(),
    );
  }

  @override
  State<RegisterDriverScreen> createState() => _RegisterDriverScreenState();
}

class _RegisterDriverScreenState extends State<RegisterDriverScreen> {
  @override
  void initState() {
    Provider.of<RegisterDriverProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterDriverProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Registrar un usuario",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: PageView(
                children: [
                  FormPersonalInformationUser(),
                  MoreData(),
                  FormLocationUser()
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
