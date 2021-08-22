import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

enum CustomTextFieldTheme {
  defaultTheme,
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText = '',
    this.theme = CustomTextFieldTheme.defaultTheme,
  });

  final String hintText;
  final CustomTextFieldTheme theme;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.primaryColor
              )
          )
      ),
    );
  }
}
