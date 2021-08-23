import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/setting_screen_widgets/setting_screen_widgets.dart';
class SettingScreen extends StatelessWidget {
  static const routeName = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: Container(),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              primary: Palette.primaryColor
            ),
            child: Text(
              'Done',
              style: TextStyle(
                color: Palette.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: ListView(
        children: [
          Text(
            'ACCOUNT SETTINGS'
          ),
          Column(
            children: [
              SettingListTile(
                text: 'Phone Number',
                onTap: (){},
              ),
              SettingListTile(
                text: 'Connected Accounts',
                onTap: (){},
              ),
              SettingListTile(
                text: 'Email',
                onTap: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
