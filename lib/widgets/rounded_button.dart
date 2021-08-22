import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

enum RoundedButtonTheme {
  white,
  primary,
  primaryGradient,
  unselected,
  selected,
}

class _RoundedButtonTheme {
  Color backgroundColor;
  Color textColor;
  Color borderColor;
  Color splashColor;
  bool hasGradient;
  LinearGradient? gradient;
  _RoundedButtonTheme({
    this.backgroundColor = Colors.white,
    this.textColor = Palette.primaryColor,
    this.borderColor = Palette.primaryColor,
    this.splashColor = Colors.black,
    this.hasGradient = false,
  }){
    if(this.hasGradient){
      this.gradient = Palette.mainGradient;
      this.backgroundColor = Colors.transparent;
      this.textColor = Colors.white;
      this.borderColor = Colors.transparent;
      this.splashColor = Colors.black;
    }
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.onPressed,
    required this.text,
    this.theme = RoundedButtonTheme.white,
    this.fontSize = 22,
    this.minWidth = false,
  });
  final void Function() onPressed;
  final String text;
  final RoundedButtonTheme theme;
  final double fontSize;
  final bool minWidth;
  _RoundedButtonTheme _getTheme(){
    switch(this.theme) {
      case RoundedButtonTheme.white:
        return _RoundedButtonTheme(
          backgroundColor: Colors.white,
          textColor: Colors.black54,
          borderColor: Palette.primaryColor,
          splashColor: Palette.primaryColor,
        );
      case RoundedButtonTheme.primary:
        return _RoundedButtonTheme(
          backgroundColor: Palette.primaryColor,
          textColor: Colors.white,
          borderColor: Colors.white,
          splashColor: Colors.white,
        );
      case RoundedButtonTheme.primaryGradient:
        return _RoundedButtonTheme(hasGradient: true);
      case RoundedButtonTheme.unselected:
        return _RoundedButtonTheme(
          backgroundColor: Colors.white,
          splashColor: Palette.primaryColor,
          textColor: Colors.black54,
          borderColor: Colors.black54,
        );
      case RoundedButtonTheme.selected:
        return _RoundedButtonTheme(
          borderColor: Palette.primaryColor,
          textColor: Palette.primaryColor,
          backgroundColor: Colors.white,
          splashColor: Palette.primaryColor,
        );
      default:
        return _RoundedButtonTheme();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    _RoundedButtonTheme theme = _getTheme();
    return SizedBox(
      width: minWidth ? null : double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: theme.hasGradient ? theme.gradient : null,
          borderRadius: BorderRadius.circular(24),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: theme.backgroundColor,
            padding: EdgeInsets.symmetric(vertical: fontSize / 2, horizontal: fontSize),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                    color: theme.borderColor,
                    width: 2
                )
            ),
            primary: theme.splashColor,
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: theme.textColor
            ),
          ),
        ),
      ),
    );
  }
}

