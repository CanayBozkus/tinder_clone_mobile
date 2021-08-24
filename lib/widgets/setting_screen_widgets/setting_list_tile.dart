import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

class SettingListTile extends StatelessWidget {
  SettingListTile({
    required this.text,
    required this.onTap,
    this.rightText = '',
  });
  final String text;
  final Function() onTap;
  final String rightText;
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
            contentPadding: EdgeInsets.only(left: 20, right: 10),
            tileColor: Colors.white,
            trailing: Container(
              width: rightText.isEmpty ? 20 : 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      rightText,
                      style: K.settingScreenInfoTextStyle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
            title: Text(
              text,
              style: K.settingsScreenTileTitleStyle,
            ),
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
