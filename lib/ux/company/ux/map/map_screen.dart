import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/map/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreenCompany extends StatefulWidget {
  const MapScreenCompany._();

  static init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapCompanyProvider(
        routeService: Provider.of<RouteService>(context, listen: false),
        socketService: Provider.of<SocketService>(context, listen: false),
      )..init(),
      builder: (context, child) => const MapScreenCompany._(),
    );
  }

  @override
  State<MapScreenCompany> createState() => _MapScreenCompanyState();
}

class _MapScreenCompanyState extends State<MapScreenCompany> {

  @override
  void initState() {
    Provider.of<MapCompanyProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        final bloc = Provider.of<MapCompanyProvider>(context);

    return Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(4.146347, -73.641619),
              zoom: 13.7,
            ),
            polylines: bloc.polylines,
            markers: bloc.markers,
          ),
        ),
      ],
    );
  }
}
