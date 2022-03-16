import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:c2sanilist/ui/app.dart';
import 'package:flutter/material.dart';

void main() {
  initializeDependencies();
  runApp(initializeBlocs(mainAppWidget: const App()));
}
