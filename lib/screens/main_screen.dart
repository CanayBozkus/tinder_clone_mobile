import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/pages/main_screen_pages/main_screen_pages.dart';
import 'package:tinder_clone/widgets/main_screen_widgets/main_screen_widgets.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    context.read<GeneralProvider>().mainScreenProvider.mainScreenTabBarController = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainScreenTabBar(),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                  DatingPage(),
                  Container(),
                  Container(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
