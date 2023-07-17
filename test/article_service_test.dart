import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:nytimes_mpa/src/service/article_service.dart';

void main() {


  test("getArticleListSuccess", () async {
    await dotenv.load();
    var articleService = ArticleService();
    var result = await articleService.getArticleList();
    expect(result is List<ArticleModel>, true);
  });
}