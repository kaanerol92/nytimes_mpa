import 'package:flutter/material.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';

class ArticleDetailView extends StatelessWidget {
  const ArticleDetailView({super.key, required this.model});

  static const routeName = '/detail';

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    String? image = model.media?.firstOrNull?.mediaMetadata?.firstOrNull?.url;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(model.publishedDate ?? "No Date")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.title ?? "No Title",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (image != null)
                Row(
                  children: [
                    Expanded(
                        child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      cacheWidth: (MediaQuery.sizeOf(context).width - 10).toInt(),
                      cacheHeight: (MediaQuery.sizeOf(context).width - 10).toInt(),
                    )),
                  ],
                ),
              if (image == null)
                Row(
                  children: [
                    Expanded(
                        child: Image.asset(
                      "assets/images/flutter_logo.png",
                      fit: BoxFit.fill,
                      cacheWidth: (MediaQuery.sizeOf(context).width - 10).toInt(),
                      cacheHeight: (MediaQuery.sizeOf(context).width - 10).toInt(),
                    )),
                  ],
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Expanded(child: Text(model.abstract ?? "No Abstract"))],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Expanded(child: Text(model.byline ?? "No Byline", style: const TextStyle(fontStyle: FontStyle.italic), textAlign: TextAlign.end,))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
