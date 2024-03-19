import 'package:esperar_app_front_flutter/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class MapCompanyProvider extends ChangeNotifier{
  final RouteService routeService;
  final SocketService socketService;

  MapCompanyProvider({required this.routeService, required this.socketService});

  Set<Polyline> polylines = {};
  Set<Marker> markers = {};



  void init() async {
    socketService.getStompClient().activate();
    final routesResponse = await routeService.findAllRoutes();
    if(routesResponse != null){
      for( var i = 0; i < routesResponse.content.length; i++  ){
            socketService.getStompClient().subscribe(
        destination: '/topic/route/${routesResponse.content[i]!.id}',
        callback: (StompFrame stompFrame) {
         
          
        });
        Polyline polyline = 
        Polyline(
        polylineId: PolylineId(routesResponse.content[i]!.id.toString()),
        color: Colors.blue,
        width: 5,
        points: routesResponse.content[i]!.coordinates!.map((e) => LatLng(double.parse(e!.latitude),double.parse(e.longitude))).toList(),
      );
      polylines.add(polyline);
      }
      notifyListeners();
    }
  }

  void updateMarker(String vehicleId, LatLng newPosition) {
    List<Marker> markerList = markers.toList();

    int markerIndex = markerList.indexWhere(
      (marker) => marker.markerId.value == vehicleId,
    );
    if (markerIndex != -1) {
      markers.remove(markerList[markerIndex]);
    }
    markers.add(
      Marker(
        markerId: MarkerId(vehicleId),
        position: newPosition,
        infoWindow: InfoWindow(title: 'Vehicle $vehicleId'),
      ),
    );
    notifyListeners();
  }

}