import 'package:flutter/material.dart';

class MainScreenProvider {
  MainScreenProvider({required this.notifyListeners});

  final void Function() notifyListeners;
  late final PageController _mainScreenTabBarController;
  int currentIndex = 0;

  set mainScreenTabBarController(PageController controller){
    this._mainScreenTabBarController = controller;
  }


  void changePage(int index){
    _mainScreenTabBarController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    currentIndex = index;
    notifyListeners();
  }
}