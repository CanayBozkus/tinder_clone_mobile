import 'package:flutter/material.dart';
import 'package:tinder_clone/route_generator.dart';
import 'package:tinder_clone/screens/screens.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await database.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GeneralProvider>(create: (_) => GeneralProvider()),
      ],
      child: MaterialApp(
        title: 'Tinder Clone',
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: database.sharedPreferences.containsKey('jwt')
            ?
        MainScreen.routeName
            :
        LoginScreen.routeName,
      ),
    );
  }
}