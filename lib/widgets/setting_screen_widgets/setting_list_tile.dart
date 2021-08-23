import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

class SettingListTile extends StatelessWidget {
  SettingListTile({
    required this.text,
    required this.onTap
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData(
            splashColor: Palette.primaryColor.withOpacity(0.2),
          ),
          child: ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            tileColor: Colors.white,
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            height: 1,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
