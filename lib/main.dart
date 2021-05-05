import 'package:digiassignment/services/locator.dart';
import 'package:digiassignment/services/navigation_service.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:digiassignment/services/router.dart' as router;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );
  }
}