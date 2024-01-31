import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/create%20route/create_route_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRouteScreen extends StatelessWidget {
  const CreateRouteScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateRouteProvider(
        routeService: Provider.of(context, listen: false),
        localStorageInterface: Provider.of<LocalStorageInterface>(context,listen: false)
      ),
      builder: (context, child) => const CreateRouteScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRouteProvider>(context);

    createRoute() async {
      final result = await bloc.createRoute();
      if(result != null){
        pop(context, result);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarCustom(
                  title: Text(
                    'RUTAS',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  action: ButtonBackScreen()),
              const Text('Crear ruta:'),
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
              Align(
                  alignment: Alignment.center,
                  child: ButtonCustom(
                    text: 'INICIAR',
                    onTap: createRoute,
                    width: 200,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
