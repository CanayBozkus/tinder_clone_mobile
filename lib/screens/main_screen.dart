import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'dart:math' as math;

import 'package:tinder_clone/widgets/elevated_circle_icon_button.dart';

class MainScreen extends StatelessWidget {
  static const routeName = 'MainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/img/tinder.png',
                    width: 35,
                  ),
                  Image.asset(
                    'assets/img/diamond.png',
                    color: Colors.black26,
                    width: 35,
                  ),
                  Image.asset(
                    'assets/img/chat.png',
                    color: Colors.black26,
                    width: 35,
                  ),
                  Image.asset(
                    'assets/img/profile.png',
                    color: Colors.black26,
                    width: 40,
                  ),

                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/img/fake_img_1.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        child: SizedBox(
                          height: 10,
                          child: Row(
                            children: [
                              ...List.generate(3, (index){
                                return Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3),
                                    child: Container(
                                      height: 4,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: index == 0 ? Colors.white : Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 3,
                                            spreadRadius: 5
                                          )
                                        ]
                                      ),
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Nadia',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.expand_more_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Hi, I\'m here to make new friends',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                wordSpacing: 3,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: ElevatedCircleIconButton(
                      icon: Icons.refresh,
                      iconColor: Colors.black26,
                      iconSize: 26,
                      onPressed: (){},
                    ),
                  ),
                  ElevatedCircleIconButton(
                    onPressed: (){},
                    icon: Icons.close,
                    iconColor: Palette.red,
                  ),
                  ElevatedCircleIconButton(
                    onPressed: (){},
                    icon: Icons.star,
                    iconSize: 26,
                    iconColor: Colors.blue,
                  ),
                  ElevatedCircleIconButton(
                    onPressed: (){},
                    icon: Icons.favorite,
                    iconColor: Colors.greenAccent,
                  ),
                  ElevatedCircleIconButton(
                    onPressed: (){},
                    icon: Icons.bolt,
                    iconSize: 26,
                    iconColor: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
