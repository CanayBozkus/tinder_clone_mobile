import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/main_screen_widgets/main_screen_widgets.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'dart:math' as math;

class DatingPage extends StatefulWidget {
  @override
  _DatingPageState createState() => _DatingPageState();
}

class _DatingPageState extends State<DatingPage> {

  late final SwipeEngine _engine = SwipeEngine();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SwipeCard(
            engine: _engine,
            children: [
              TinderCard(
                img: 'assets/img/fake_img_1.jpg',
                header: 'Nadia',
                bio: 'Hi, I\'m here to make new friends',
              ),
              TinderCard(
                img: 'assets/img/fake_img_2.jpg',
                header: 'Bella',
                bio: 'Hi, I\'m here to make new friends',
              )
            ],
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
                onPressed: (){
                  _engine.swipeLeft();
                },
                icon: Icons.close,
                iconColor: Palette.red,
              ),
              ElevatedCircleIconButton(
                onPressed: (){
                  _engine.swipeUp();
                },
                icon: Icons.star,
                iconSize: 26,
                iconColor: Colors.blue,
              ),
              ElevatedCircleIconButton(
                onPressed: (){
                  _engine.swipeRight();
                },
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
    );
  }
}
