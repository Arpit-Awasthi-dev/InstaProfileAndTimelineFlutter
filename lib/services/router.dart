import 'package:digiassignment/screens/track_order_screen/track_order_screen.dart';
import 'package:digiassignment/screens/home_screen/home_screen.dart';
import 'package:digiassignment/utility/constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var data = settings.arguments;
  switch (settings.name) {

    case TrackOrderScreenRoute:
      return MaterialPageRoute(builder: (context) => TrackOrderScreen());
      break;

    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
      break;

  }
}