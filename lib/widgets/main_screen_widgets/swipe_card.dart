
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
  DragStartDetails? startDetails;
  DragUpdateDetails? updateDetails;
  DragEndDetails? endDetails;
  Animation<Offset>? rangeAnimation;
  Animation<double>? transformAnimation;
  Alignment alignment = Alignment.center;
  double dragX = 0;
  double dragY = 0;

  init(){
    setMovementAnimation(Movement.none);
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        print('complete');
        //this.frontCardIndex += 1;
        //this.backCardIndex +=1;
        this.stateController!((){});
        //animationController.reset();
      }
      if(status == AnimationStatus.forward){

      }
    });
  }

  void reject(){
    setMovementAnimation(Movement.left);
    startAnimation();
  }

  void like(){
    setMovementAnimation(Movement.right);
    startAnimation();
  }

  void startAnimation(){
    animationController.forward();
    stateController!((){});
  }

  Widget frontCardBuilder(){

    if(frontCardIndex + 1 > children.length){
      return Container();
    }

    return RotationTransition(
      turns: transformAnimation!,
      child: SlideTransition(
        position: rangeAnimation!,
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

  void setMovementAnimation(Movement movement){
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
  }

  void dragStart(DragStartDetails details){
    startDetails = details;

  }

  void dragUpdate(DragUpdateDetails details, Size size){
    if(updateDetails == null){
      updateDetails = details;
      return;
    }
    double x = dragX + (details.delta.dx)/(size.width *2);
    double y = dragY + (details.delta.dy)/(size.height *2);
    print('x: $x    y:$y');
    rangeAnimation = Tween<Offset>(
      begin: Offset(dragX, dragY),
      end: Offset(x, y),
    ).animate(animationController);
    transformAnimation = Tween<double>(begin:0, end: 0).animate(animationController);
    updateDetails = details;
    dragX = x ;
    dragY = y ;
    startAnimation();

  }

  void dragEnd(DragEndDetails details){
    endDetails = details;

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

   controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
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
        //widget.engine.backCardBuilder(),
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
