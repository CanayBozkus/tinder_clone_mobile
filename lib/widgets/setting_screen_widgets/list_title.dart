import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  ListTitle({
    required this.title
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black38,
        ),
      ),
    );
  }
}
