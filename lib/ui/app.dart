import 'package:c2sanilist/ui/screens/home.screen.dart';
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
      routes: {
        HomeScreen.ROUTE: (_) => HomeScreen(),
      },
    );
  }
}
