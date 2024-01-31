import 'package:esperar_app_front_flutter/ux/layout/layout_provider.dart';
import 'package:esperar_app_front_flutter/ux/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      builder: (context, child) => const LayoutScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LayoutProvider>(context);
    List<Widget> pages =  [  RoutesScreen.init(context),  NewsScreen(),  MapScreen(), ChatScreen(), ProfileScreen.init(context)];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: pages.elementAt(bloc.getPage()))
          ],
                ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'RUTAS',
            icon: Icon(
              Icons.route_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'NOTICIAS',
            icon: Icon(
              Icons.newspaper_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'MAPA',
            icon: Icon(
              Icons.map_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'CHAT',
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
            ),
          ),
                    BottomNavigationBarItem(
            label: 'MI PERFIL',
            icon: Icon(
              Icons.person_2_outlined,
            ),
          )
        ],
        onTap: (value) => bloc.setPage(value),
        currentIndex: bloc.getPage(),
        elevation: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
