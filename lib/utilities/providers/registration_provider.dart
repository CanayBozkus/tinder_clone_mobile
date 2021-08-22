import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  late PageController _controller;
  late int _pageCount;
  int _currentPage = 0;

  set pageController(PageController controller){
    this._controller = controller;
  }

  set pageCount(int count){
    this._pageCount = count;
  }

  void nextPage(){
    if(_currentPage + 1 == _pageCount){
      return;
    }
    _currentPage += 1;
    _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn
    );
  }

  bool previousPage(){
    if(_currentPage == 0){
      return false;
    }
    _currentPage -= 1;
    _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn
    );
    return true;
  }
}