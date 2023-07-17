import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nytimes_mpa/src/controller/main_controller.dart';
import 'package:nytimes_mpa/src/model/article_model.dart';
import 'package:nytimes_mpa/src/view/article_detail_view.dart';
import 'package:nytimes_mpa/src/view/article_list_view.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

class NyTimesMPA extends StatelessWidget {
  const NyTimesMPA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      child: OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent)),
          darkTheme: ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent)),
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ArticleDetailView.routeName:
                    return ArticleDetailView(model: routeSettings.arguments as ArticleModel);
                  case ArticleListView.routeName:
                    return const ArticleListView();
                  default:
                    return const ArticleListView();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
