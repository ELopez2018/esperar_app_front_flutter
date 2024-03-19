// ignore_for_file: use_build_context_synchronously

import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/create%20route/create_route_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRouteCompanyScreen extends StatelessWidget {
  const CreateRouteCompanyScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateRouteProvider(
          routeService: Provider.of(context, listen: false),
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false)),
      builder: (context, child) => const CreateRouteCompanyScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRouteProvider>(context);

    createRoute(bool isMap) async {
      final result = await bloc.createRoute();
      if (result != null) {
        if(isMap){
          push(context, 'create-route-map', result);
        }else{
        pop(context, result);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBarCustom(
                          title: Text(
                            'Crear ruta',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          action: ButtonBackScreen()),
                      const SizedBox(height: 20),
                      InputCustom(
                        label: 'Nombre',
                        controller: bloc.name,
                      ),
                      const SizedBox(height: 20),
                      InputCustom(
                        label: 'Desde',
                        controller: bloc.from,
                      ),
                      const SizedBox(height: 20),
                      InputCustom(
                        label: 'Hasta',
                        controller: bloc.to,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            'Trazar ruta',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          Checkbox(
                            value: bloc.getIsMap(),
                            onChanged: bloc.setIsMap,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: ButtonCustom(
                          text: bloc.getIsMap() ? 'Ir al mapa' : 'Crear Ruta',
                          color: Colors.white,
                          borderColor: Colors.transparent,
                          background: const Color(0xFFf40d53),
                          onTap: () => 
                              createRoute( bloc.getIsMap() ? true: false),
                          width: 200,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (bloc.state == StateProgress.loading)
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
