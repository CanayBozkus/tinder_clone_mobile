
import 'package:flutter/material.dart';
import 'dart:math' as math;

enum Movement {
  right,
  left,
  up,
  none
}

class SwipeEngine {

  late List<Widget> children;
  late AnimationController animationController;
  void Function(void Function())? stateController;
  late List<Widget> transitionedChildren;
  int frontCardIndex = 0;
  int backCardIndex = 1;
  Movement movement = Movement.none;

  init(){
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        //print('complete');
        this.frontCardIndex += 1;
        this.backCardIndex +=1;
        this.stateController!((){});
        animationController.reset();
      }
      if(status == AnimationStatus.forward){

      }
    });
  }

  void reject(){
    startAnimation(Movement.left);
  }

  void like(){
    startAnimation(Movement.right);
  }

  void startAnimation(Movement currentMovement){
    this.movement = currentMovement;
    animationController.forward();
    stateController!((){});
  }

  Widget frontCardBuilder(){
    late Animation<Offset> rangeAnimation;
    late Animation<double> transformAnimation;

    if(movement == Movement.right){
      rangeAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(3, -1),).animate(animationController);
      transformAnimation = Tween<double>(begin:0, end: 0.2).animate(animationController);
    }

    else if (movement == Movement.left){
      rangeAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(-3, -1),).animate(animationController);
      transformAnimation = Tween<double>(begin:0, end: -0.2).animate(animationController);
    }

    else {
      rangeAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0, 0),).animate(animationController);
      transformAnimation = Tween<double>(begin:0, end: 0).animate(animationController);
    }


    if(frontCardIndex + 1 > children.length){
      return Container();
    }

    return RotationTransition(
      turns: transformAnimation,
      child: SlideTransition(
        position: rangeAnimation,
        child: children[frontCardIndex],
      ),
    );
  }

  Widget backCardBuilder(){
    if(backCardIndex + 1 > children.length){
      return Container();
    }
    return children[backCardIndex];
  }
}

class SwipeCard extends StatefulWidget {

  SwipeCard({required this.engine, required this.children});

  final SwipeEngine engine;
  final List<Widget> children;

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

   controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);

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
        widget.engine.frontCardBuilder()
        //...widget.engine.builder()
        /*
        SlideTransition(
          position: widget.engine.offsetAnimation,
          child: widget.engine.cardBuilder(),
        ),
        SlideTransition(
          position: widget.engine.offsetAnimation,
          child: widget.engine.children[1],
        ),*/
        //...widget.engine.children,
      ],
    );
  }
}
