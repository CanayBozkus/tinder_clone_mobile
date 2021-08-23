import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';

class MainScreenTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainScreenProvider providerRead = context.read<GeneralProvider>().mainScreenProvider;
    int index = context.watch<GeneralProvider>().mainScreenProvider.currentIndex;
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                primary: Palette.primaryColor
            ),
            child: Image.asset(
              'assets/img/tinder.png',
              width: 35,
              color: index == 0 ? Palette.primaryColor : Colors.black26,
            ),
            onPressed: (){
              providerRead.changePage(0);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                primary: Palette.yellow
            ),
            child: Image.asset(
              'assets/img/diamond.png',
              color: Colors.black26,
              width: 35,
            ),
            onPressed: (){
              providerRead.changePage(1);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                primary: Palette.red
            ),
            child: Image.asset(
              'assets/img/chat.png',
              color: Colors.black26,
              width: 35,
            ),
            onPressed: (){
              providerRead.changePage(2);
            },
          ),
          TextButton(
            child: Image.asset(
              'assets/img/profile.png',
              color: Colors.black26,
              width: 40,
            ),
            onPressed: (){
              providerRead.changePage(3);
            },
          ),

        ],
      ),
    );
  }
}
