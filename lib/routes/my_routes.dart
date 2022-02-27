import 'package:api_placeholder/core/components/tab_bar.dart';
import 'package:api_placeholder/screens/posts/post_info_page.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/":
        return MaterialPageRoute(builder: (ctx) => const MyTabBar());
      case "/postinfo":
        return MaterialPageRoute(builder: (ctx) => PostInfoPage(index: (args as int),));
    }
  }
}
