import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

class SwitchTile extends StatelessWidget {
  SwitchTile({
    required this.value,
    required this.text,
    required this.onChanged
  });
  final String text;
  final bool value;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 20, right: 10),
          tileColor: Colors.white,
          trailing: Switch(
            activeColor: Palette.primaryColor,
            inactiveThumbColor: Colors.grey.shade200,
            onChanged: onChanged,
            value: value,
          ),
          title: Text(
            text,
            style: K.settingsScreenTileTitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            height: 0.5,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}
