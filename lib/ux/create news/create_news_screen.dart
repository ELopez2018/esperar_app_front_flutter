import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/create%20news/create_news_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewsScreen extends StatelessWidget {
  const CreateNewsScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateNewsProvider(
        newsService: Provider.of<NewsService>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
      ),
      builder: (context, child) => const CreateNewsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateNewsProvider>(context);

    createNews() async {
      final result = await bloc.createNews();
      if (result != null) {
        pop(context, result);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBarCustom(
                action: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton()
                  ],
                ),
                title: const Text(
                  'Noticia',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  InputCustom(
                    label: 'Titulo',
                    controller: bloc.title,
                  ),
                  InputCustom(
                    label: 'Contenido',
                    maxLines: 10,
                    controller: bloc.content,
                  ),
                  const SizedBox(height: 20),
                  ButtonCustom(
                    text: 'Crear noticia',
                    color: Colors.white,
                    borderColor: Colors.transparent,
                    background: const Color(0xFFf40d53),
                    onTap: createNews,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
