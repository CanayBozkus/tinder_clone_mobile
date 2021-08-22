import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case LoginScreen.routeName: return MaterialPageRoute(builder: (_) => LoginScreen());
      case RegisterScreen.routeName: return MaterialPageRoute(builder: (_) => RegisterScreen());
      default: return MaterialPageRoute(builder: (_) => Text('error'));
    }
  }
}