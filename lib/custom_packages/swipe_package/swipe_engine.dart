import 'package:flutter/material.dart';
import 'package:tinder_clone/custom_packages/swipe_package/enums.dart';
import 'package:tinder_clone/custom_packages/swipe_package/swipe_package.dart';
import 'package:tinder_clone/custom_packages/swipe_package/tinder_card_ui.dart';

class SwipeEngine {

  late List<TinderCard> children;
  late AnimationController animationController;
  late void Function(void Function()) stateController;
  int frontCardIndex = 0;
  int backCardIndex = 1;
  Animation<Offset>? rangeAnimation;
  Animation<double>? transformAnimation;
  double dragX = 0;
  double dragY = 0;
  bool dragStarted = false;
  Movement movement = Movement.none;
  DragAction dragAction = DragAction.none;

  double leftSwipeDestinationX = -3;
  double rightSwipeDestinationX = 3;
  double leftSwipeDestinationY = -1;
  double rightSwipeDestinationY = -1;
  double dragLeftXLimit = -0.3;
  double dragRightXLimit = 0.3;
  double dragYLimit = -0.25;
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

  void swipeLeft(){
    movement = Movement.click;
    setRangeAnimation(0, 0, leftSwipeDestinationX, leftSwipeDestinationY);
    setTransformAnimation(0, -0.2);
    children[frontCardIndex].action = TinderCardAction.left;
    startAnimation();
  }

  void swipeRight(){
    movement = Movement.click;
    setRangeAnimation(0, 0, rightSwipeDestinationX, rightSwipeDestinationY);
    setTransformAnimation(0, 0.2);
    children[frontCardIndex].action = TinderCardAction.right;
    startAnimation();
  }

  void swipeUp(){
    movement = Movement.click;
    setRangeAnimation(0, 0, 0, -5);
    setTransformAnimation(0, 0);
    children[frontCardIndex].action = TinderCardAction.up;
    startAnimation();
  }

  void rollBack(){
    if(frontCardIndex -1 < 0){
      return;
    }

    if(children[frontCardIndex -1].action == TinderCardAction.left){
      setRangeAnimation(leftSwipeDestinationX, leftSwipeDestinationY, 0, 0);
      setTransformAnimation(-0.2, 0);
    }

    else if(children[frontCardIndex -1].action == TinderCardAction.right){
      setRangeAnimation(rightSwipeDestinationX, rightSwipeDestinationY, 0, 0);
      setTransformAnimation(0.2, 0);
    }

    else if(children[frontCardIndex -1].action == TinderCardAction.up){
      setRangeAnimation(0, -5, 0, 0);
      setTransformAnimation(0, 0);
    }

    frontCardIndex-=1;
    backCardIndex-=1;
    children[frontCardIndex].action = TinderCardAction.none;
    movement = Movement.rollBack;
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
        child: TinderCardUI(card: children[frontCardIndex],),
      ),
    );
  }

  Widget backCardBuilder(){
    if(backCardIndex + 1 > children.length){
      return Container();
    }
    return TinderCardUI(card: children[backCardIndex],);
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
    movement = Movement.drag;
  }

  void dragUpdate(DragUpdateDetails details, Size size){
    double x = dragX + (details.delta.dx)/(size.width *2);
    double y = dragY + (details.delta.dy)/(size.height *2);

    setRangeAnimation(dragX, dragY, x, y);
    setTransformAnimation(dragX / 10, x / 10);

    dragX = x ;
    dragY = y ;
    startAnimation();
  }

  void checkDragResult(){
    if(dragX > dragLeftXLimit && dragX < dragRightXLimit && dragY > dragYLimit){
      dragAction = DragAction.reset;
    }
    else {
      dragAction = DragAction.swipe;
    }
  }

  void resetDrag(){
    setRangeAnimation(dragX, dragY, 0, 0);
    setTransformAnimation(dragX / 10, 0);
    startAnimation();
    dragX = 0;
    dragY = 0;
  }

  void dragSwipe(){
    if(dragY < dragYLimit){
      setRangeAnimation(dragX, dragY, 0, -3);
      setTransformAnimation(dragX / 10, 0);
      children[frontCardIndex].action = TinderCardAction.up;
    }

    else if(dragX < dragLeftXLimit){
      setRangeAnimation(dragX, dragY, leftSwipeDestinationX, leftSwipeDestinationY);
      setTransformAnimation(dragX / 10, -0.2);
      children[frontCardIndex].action = TinderCardAction.left;
    }

    else if(dragX > dragRightXLimit){
      setRangeAnimation(dragX, dragY, rightSwipeDestinationX, rightSwipeDestinationY);
      setTransformAnimation(dragX / 10, 0.2);
      children[frontCardIndex].action = TinderCardAction.right;
    }

    startAnimation();
    dragX = 0;
    dragY = 0;
  }

  void dragEnd(DragEndDetails details){
    checkDragResult();

    if(dragAction == DragAction.reset){
      resetDrag();
    }
    else {
      dragSwipe();
    }

  }
}