import 'package:esperar_app_front_flutter/ux/company/ux/screens.dart';
import 'package:flutter/material.dart';

companyRoutes(BuildContext context) => {
      'layout-company': (context) => LayoutScreenCompany.init(context),
      'create-route': (context) => CreateRouteCompanyScreen.init(context),
      'create-route-map': (context) => CreateRouteMapScreen.init(context),
      'register-vehicle': (context) => RegisterVehicleScreen.init(context),
      'register-driver': (context) => RegisterDriverScreen.init(context),
      'detail-company-route': (context) => DetailCompanyRoute()
    };
