import 'package:esperar_app_front_flutter/core/const/colors.dart';
import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/providers/pop_ups_provider.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/layout/layout_provider.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/layout/widgets/drawer_provider.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/map/map_screen.dart';
import 'package:esperar_app_front_flutter/ux/company/ux/screens.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreenCompany extends StatefulWidget {
  const LayoutScreenCompany._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrawerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LayoutCompanyProvider(),
        )
      ],
      builder: (context, child) => const LayoutScreenCompany._(),
    );
  }

  @override
  State<LayoutScreenCompany> createState() => _LayoutScreenCompanyState();
}

class _LayoutScreenCompanyState extends State<LayoutScreenCompany> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = Provider.of<LayoutCompanyProvider>(context);
    List<Widget> pages = [RoutesCompanyScreen.init(context), MapScreenCompany.init(context), VehiclesScreen(), DriversScreen.init()];
        List<String> title = ['Rutas', 'Mapa', 'Vehiculos', 'Conductores'];


    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Column(
              children: [
                AppBarCustom(
                  action: GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.menu),
                      )),
                  title:  Text(
                    title.elementAt(bloc.getPage()),
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: pages.elementAt(bloc.getPage())),
                BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.route_outlined,
                      ),
                      label: 'Rutas',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.map_rounded),
                      label: 'Mapa',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.car_crash_sharp,
                      ),
                      label: 'Vehículos',
                    ),
                                        BottomNavigationBarItem(
                      icon: Icon(
                        Icons.people,
                      ),
                      label: 'Usuarios',
                    )
                  ],
                  onTap: (value) => bloc.setPage(value),
                  currentIndex: bloc.getPage(),
                  elevation: 1,
                  backgroundColor: Colors.white,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.grey,
                ),
              ],
            )),
            const Positioned.fill(child: PopUps()),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => pop(context, null),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                Container(
                  width: size.width > 500 ? 300 : 150,
                  height: size.width > 500 ? 300 : 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      shape: BoxShape.circle),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  ButtonCustom(
                    text: 'Cerrar sesión',
                    onTap: () {
                      pop(context, null);
                      Provider.of<PopUpsProvider>(context, listen: false)
                          .setCloseSession();
                    },
                    background: primaryColor,
                    color: Colors.white,
                    borderColor: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
