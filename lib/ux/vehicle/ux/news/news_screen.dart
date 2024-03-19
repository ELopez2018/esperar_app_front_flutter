import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/news/news_provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(
        newsService: Provider.of<NewsService>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
            socketService: Provider.of<SocketService>(context, listen: false)
      )..init(),
      builder: (context, child) => const NewsScreen._(),
    );
  }

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    final bloc = Provider.of<NewsProvider>(context, listen: false);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Column(
            children: [
              const AppBarCustom(
                title: Text(
                  'NOTICIAS',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: bloc.news != null
                    ? bloc.news!.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return NewsItem(news: bloc.news![index]!,);
                            },
                            itemCount: bloc.news!.length,
                          )
                        : const Center(
                            child: Text('No hay noticias.....'),
                          )
                    : const Center(
                        child: CircularProgressIndicator(color: Color(0xFFf40d53),),
                      ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: GestureDetector(
              onTap: () async {
                  final result =
                      await push(context, 'create-news', null) as NewsModel?;
                  if (result != null) {
                    bloc.addNews(result);
                  }
                },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFf40d53),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const  BoxConstraints(
        maxHeight: 200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
            ),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                   DateTime.now().toString(),
                    style:
                        const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Text(
                      news.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Colors.black)),
                          child:
                              const Text('ME GUSTA'),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Colors.black)),
                          child:
                              const Text('COMENTAR'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
