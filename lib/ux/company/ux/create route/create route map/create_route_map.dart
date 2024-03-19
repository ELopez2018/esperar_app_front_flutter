import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/core/const/state_progress_enum.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/create%20route/create%20route%20map/create_route_map_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CreateRouteMapScreen extends StatelessWidget {
  const CreateRouteMapScreen._();

  static Widget init(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as RouteModel;
    return ChangeNotifierProvider(
      create: (context) => CreateRouteMapProvider(
          routeService: Provider.of<RouteService>(context, listen: false),
          localStorageInterface:
              Provider.of<LocalStorageInterface>(context, listen: false))
        ..setIdPoint(id),
      builder: (context, child) => const CreateRouteMapScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRouteMapProvider>(context);

    void updateRoute() async {
      final result = await bloc.updateRoute();
      if (result != null) {
        pushReplacement(context, 'layout-company', result);
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(4.146347, -73.641619),
                zoom: 13.7,
              ),
              onTap: bloc.onTap,
              markers: bloc.getMarkets(),
              polylines: {
                if (bloc.getPolyline() != null) bloc.getPolyline()!,
              },
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () => bloc.removePoint(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    color: bloc.polylinePoints.isNotEmpty
                        ? primaryColor
                        : Colors.grey,
                  ),
                  Text(
                    'Eliminar Ultimo punto',
                    style: TextStyle(
                        color: bloc.polylinePoints.isNotEmpty
                            ? primaryColor
                            : Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: ButtonCustom(
              text: 'Guardar ruta',
              color: Colors.white,
              borderColor: Colors.white,
              background: primaryColor,
              onTap: updateRoute,
            ),
          ),
          if (bloc.state == StateProgress.loading)
            const ProgressIndicatorCustom()
        ],
      ),
    );
  }
}
