import 'package:flutter/cupertino.dart';
import 'package:spam_request/export_files.dart';
import 'package:spam_request/views/categories/commentary/commentary_view.dart';

class FullRoutes {
  Route? ongenerateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    dynamic args = settings.arguments;

    switch (routeName) {
      case RouteNames.tabBox:
        return customPageRoute(TabScreen());
      case RouteNames.commentary:
        return customPageRoute(CommentaryView(
          category: args,
        ));

      // default:
      // return customPageRoute(SplashView());
    }
    return null;
  }

  customPageRoute(Widget child) {
    return CupertinoPageRoute(
      builder: (context) => child,
    );
  }
}
