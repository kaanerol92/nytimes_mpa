import 'package:flutter/material.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:provider/provider.dart';

import '../util/helper.dart';
import '../controller/main_controller.dart';
import 'article_detail_view.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Helper.showNotification(const Text("https://kaanerol.dev"));
            },
            icon: const Icon(Icons.menu)),
        title: const Text(
          'NY Times Most Popular',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Provider.of<MainController>(context, listen: false).getArticleList();
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_sharp),
            onPressed: () {
              Helper.showNotification(const Text("https://kaanerol.dev"));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<MainController>(context, listen: true).articleList.length,
        itemBuilder: (BuildContext context, int index) {
          ArticleModel model = Provider.of<MainController>(context, listen: false).articleList[index];
          String? avatar = model.media?.firstOrNull?.mediaMetadata?.firstOrNull?.url;

          return ListTile(
              title: Text(model.title ?? "", overflow: TextOverflow.ellipsis, maxLines: 2),
              leading: CircleAvatar(
                foregroundImage: (avatar != null) ? NetworkImage(avatar) : const AssetImage("assets/images/flutter_logo.png") as ImageProvider<Object>,
              ),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_right)),
              dense: true,
              subtitle: Row(
                children: [
                  Expanded(child: Text(model.byline ?? "", overflow: TextOverflow.ellipsis, maxLines: 2)),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(model.publishedDate ?? "No Date"),
                    ],
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, ArticleDetailView.routeName, arguments: model);
              });
        },
      ),
    );
  }
}
