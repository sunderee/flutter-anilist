import 'package:c2sanilist/config/router.config.dart';
import 'package:c2sanilist/ui/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightAppTheme(context),
      darkTheme: darkAppTheme(context),
      initialRoute: initialAppRoute,
      routes: appRoutes,
    );
  }
}
