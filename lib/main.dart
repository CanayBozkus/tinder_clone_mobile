import 'package:flutter/material.dart';
import 'package:tinder_clone/route_generator.dart';
import 'package:tinder_clone/screens/screens.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GeneralProvider>(create: (_) => GeneralProvider()),
        ChangeNotifierProvider<RegistrationProvider>(create: (_) => RegistrationProvider()),
      ],
      child: MaterialApp(
        title: 'Tinder Clone',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: LoginScreen(),
      ),
    );
  }
}