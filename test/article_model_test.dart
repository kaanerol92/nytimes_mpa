import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:nytimes_mpa/src/model/media_model.dart';

void main() {
  test("articlemodel", () async {
    var model = ArticleModel(
      title: "title",
    );
    expect(model.title, "title");
  });

  test("articlemodelfromjson", () async {
    Map<String, dynamic> json = {"title": "title"};

    var model = ArticleModel.fromJson(json);
    expect(model.title, "title");
  });

  test("articlemodeltojson", () async {
    var model = ArticleModel(
      title: "title",
    );
    Map<String,dynamic> json = model.toJson();
    expect(json["title"], "title");
  });
}
