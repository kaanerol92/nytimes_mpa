import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:nytimes_mpa/src/service/base/base_service.dart';
import 'package:nytimes_mpa/src/util/http_manager.dart';
import 'package:nytimes_mpa/src/util/environment.dart';

class ArticleService extends BaseService<ArticleService> {
  String weeklyViewedPath = Environment.viewedEndpoint + "/7.json";
  String apiKeyParam = "api-key";
  String resultsField = "results";


  Future<List<ArticleModel>> getArticleList() async {
    List<ArticleModel> articleList = List.empty(growable: true);
    Map<String, dynamic> params = {apiKeyParam: Environment.apiKey};

    var result = await HttpManager.instance.get(
      weeklyViewedPath,
      params: params
    );

    var articles = result[resultsField];

    for (var article in articles) {
      articleList.add(ArticleModel.fromJson(article));
    }

    articleList.sort((a, b) {
      var aDate = DateTime.parse(a.publishedDate.toString());
      var bDate = DateTime.parse(b.publishedDate.toString());
      return bDate.compareTo(aDate);
    });

    return articleList;
  }
}
