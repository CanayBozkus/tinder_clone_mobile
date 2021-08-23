import 'package:flutter/material.dart';

class ElevatedCircleIconButton extends StatelessWidget {
  ElevatedCircleIconButton({
    required this.icon,
    this.iconColor = Colors.black,
    this.iconSize = 35,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.splashColor = Colors.grey,
  });

  final Color iconColor;
  final double iconSize;
  final Function onPressed;
  final Color backgroundColor;
  final Color splashColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: const EdgeInsets.all(10),
        onPrimary: splashColor,
        primary: backgroundColor,
        elevation: 3,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
