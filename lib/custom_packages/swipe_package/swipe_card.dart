
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tinder_clone/custom_packages/swipe_package/swipe_engine.dart';
import 'package:tinder_clone/custom_packages/swipe_package/swipe_package.dart';


class SwipeCard extends StatefulWidget {

  SwipeCard({required this.engine, required this.children});

  final SwipeEngine engine;
  final List<TinderCard> children;

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> with SingleTickerProviderStateMixin  {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
   super.initState();
   widget.engine.stateController = setState;
   widget.engine.children = widget.children.reversed.toList();

   controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
   widget.engine.animationController = controller;
   widget.engine.init();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        widget.engine.backCardBuilder(),
        GestureDetector(
          onPanStart: (DragStartDetails details){
            widget.engine.dragStart(details);
          },
          onPanUpdate: (DragUpdateDetails details){
            widget.engine.dragUpdate(details, MediaQuery.of(context).size);
          },
          onPanEnd: (DragEndDetails details){
            widget.engine.dragEnd(details);
          },
          child: widget.engine.frontCardBuilder(),
        ),
      ],
    );
  }
}
