import 'package:flutter/material.dart';

class NavigationService{

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateWithBack(String routeName, {var arguments}){
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateWithNoBack(String routeName, {var arguments}){
    return navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateWithRemovingAllPrevious(String routeName, {var arguments}){
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName,(Route<dynamic> route) => false, arguments: arguments);
  }

  goBack(){
    return navigatorKey.currentState.pop();
  }

}