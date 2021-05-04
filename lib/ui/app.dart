import 'package:c2sanilist/ui/screens/home.screen.dart';
import 'package:c2sanilist/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      initialRoute: HomeScreen.ROUTE,
      theme: ThemeData(
        primaryColor: COLOR_PRODUCT,
        accentColor: COLOR_PRODUCT,
        scaffoldBackgroundColor: COLOR_BACKGROUND,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
      ),
      routes: {
        HomeScreen.ROUTE: (_) => HomeScreen(),
      },
    );
  }
}
