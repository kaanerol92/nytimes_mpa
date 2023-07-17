import 'package:flutter/material.dart';
import 'package:nytimes_mpa/src/controller/base/base_controller.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:nytimes_mpa/src/service/article_service.dart';

import '../util/helper.dart';

class MainController extends BaseController<MainController> {
  ArticleService articleService = ArticleService();
  List<ArticleModel> articleList = List.empty(growable: true);

  Future getArticleList() async {
    var loading = Helper.showLoading();
    try {
      var now = DateTime.now();
      articleList = await articleService.getArticleList();
      logger.info("[getArticleList] Collected in : ${Helper.getDiff(now).toString()} ms");
      notifyListeners();
    } catch (e) {
      logger.info("[getArticleList] Couldn't retrieve list! $e");
      Helper.showNotification(const Text("Error while collecting data! Please try again."));
    } finally {
      loading.dismiss();
    }
  }
}
