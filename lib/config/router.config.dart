import 'package:c2sanilist/ui/screens/details.screen.dart';
import 'package:c2sanilist/ui/screens/home.screen.dart';
import 'package:flutter/material.dart';

typedef RoutesMap = Map<String, WidgetBuilder>;

const String initialAppRoute = HomeScreen.routeName;

final RoutesMap appRoutes = {
  HomeScreen.routeName: (_) => const HomeScreen(),
  DetailsScreen.routeName: (_) => const DetailsScreen(),
};
