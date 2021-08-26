
import 'package:flutter/material.dart';
import 'dart:math' as math;

enum Movement {
  none,
  drag,
  click,
}

enum DragAction {
  swipe,
  reset,
  none,
}

class SwipeEngine {

  late List<Widget> children;
  late AnimationController animationController;
  late void Function(void Function()) stateController;
  int frontCardIndex = 0;
  int backCardIndex = 1;
  DragStartDetails? startDetails;
  DragUpdateDetails? updateDetails;
  DragEndDetails? endDetails;
  Animation<Offset>? rangeAnimation;
  Animation<double>? transformAnimation;
  double dragX = 0;
  double dragY = 0;
  bool dragStarted = false;
  Movement movement = Movement.none;
  DragAction dragAction = DragAction.none;

  init(){
    setRangeAnimation(0, 0, 0, 0);
    setTransformAnimation(0, 0);

    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationCompleteHandler();
      }
    });
  }

  void animationCompleteHandler(){
    if(movement == Movement.click){
      clickAnimationCompleteHandler();
    }

    else if(movement == Movement.drag){
      dragAnimationCompleteHandler();
    }

    movement = Movement.none;
    setRangeAnimation(0, 0, 0, 0);
    setTransformAnimation(0, 0);
    this.stateController((){});
    animationController.reset();
  }

  void clickAnimationCompleteHandler(){
    this.frontCardIndex += 1;
    this.backCardIndex +=1;
  }

  void dragAnimationCompleteHandler(){
    if(dragAction == DragAction.swipe){
      frontCardIndex+=1;
      backCardIndex+=1;
    }
    dragAction = DragAction.none;
    setTransformAnimation(0, 0);
    setRangeAnimation(0, 0, 0, 0);
    startAnimation();
  }


  void reject(){
    //setMovementAnimation(Movement.left);
    movement = Movement.click;
    setRangeAnimation(0, 0, -3, -1);
    setTransformAnimation(0, -0.2);
    startAnimation();
  }

  void like(){
    //setMovementAnimation(Movement.right);
    movement = Movement.click;
    setRangeAnimation(0, 0, 3, -1);
    setTransformAnimation(0, 0.2);
    startAnimation();
  }

  void startAnimation(){
    animationController.forward();
    stateController((){});
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

  void setRangeAnimation(double startX, double startY, double endX, double endY){
    rangeAnimation = Tween<Offset>(
      begin: Offset(startX, startY),
      end: Offset(endX, endY),
    ).animate(animationController);
  }

  void setTransformAnimation(double begin, double end){
    transformAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(animationController);
  }

  void dragStart(DragStartDetails details){
    startDetails = details;
    movement = Movement.drag;
  }

  void dragUpdate(DragUpdateDetails details, Size size){
    if(updateDetails == null){
      updateDetails = details;
      return;
    }
    double x = dragX + (details.delta.dx)/(size.width *2);
    double y = dragY + (details.delta.dy)/(size.height *2);

    rangeAnimation = Tween<Offset>(
      begin: Offset(dragX, dragY),
      end: Offset(x, y),
    ).animate(animationController);
    transformAnimation = Tween<double>(begin:dragX / 10, end: x / 10).animate(animationController);
    updateDetails = details;
    dragX = x ;
    dragY = y ;
    startAnimation();

  }

  void dragEnd(DragEndDetails details){
    endDetails = details;
    print('end');

    if(dragX > -0.3 && dragX < 0.3){
      dragAction = DragAction.reset;
      setRangeAnimation(dragX, dragY, 0, 0);
      setTransformAnimation(dragX / 10, 0);
      startAnimation();
      dragX = 0;
      dragY = 0;
    }

    else if(dragX < -0.3){
      dragAction = DragAction.swipe;
      setRangeAnimation(dragX, dragY, -3, -1);
      setTransformAnimation(dragX / 10, -0.2);
      startAnimation();
      dragX = 0;
      dragY = 0;
    }

    else if(dragX > -0.3){
      dragAction = DragAction.swipe;
      setRangeAnimation(dragX, dragY, 3, -1);
      setTransformAnimation(dragX / 10, 0.2);
      startAnimation();
      dragX = 0;
      dragY = 0;
    }

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
