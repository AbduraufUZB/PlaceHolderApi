import 'package:api_placeholder/core/components/theme_comp.dart';
import 'package:api_placeholder/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final MyRoutes _myRoutes = MyRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlaceHolder',
      theme: ThemeComp.mainTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _myRoutes.onGenerateRoute,
      initialRoute: "/",
    );
  }
}
