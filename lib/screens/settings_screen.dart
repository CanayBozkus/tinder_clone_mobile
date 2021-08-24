import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/setting_screen_widgets/setting_screen_widgets.dart';
class SettingScreen extends StatefulWidget {
  static const routeName = 'SettingsScreen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  RangeValues ageRange = RangeValues(18, 40);
  double distanceValue = 10;
  bool global = false;
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
          ListTitle(title: 'ACCOUNT SETTINGS'),
          SettingListTile(
            text: 'Phone Number',
            onTap: (){},
            rightText: '0 555 653 85 37',
          ),
          SettingListTile(
            text: 'Connected Accounts',
            onTap: (){},
          ),
          SettingListTile(
            text: 'Email',
            rightText: 'nadia.nadia@hotmail.comaaaaa',
            onTap: (){},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Verify an Email to help secure your account',
                style: K.settingScreenInfoTextStyle,
              ),
            ),
          ),
          ListTitle(title: 'DISCOVERY'),
          SettingListTile(
            text: 'Location',
            rightText: 'New York, NY',
            onTap: (){},
          ),
          RangeTile(
            title: 'Maximum Distance',
            value: distanceValue,
            onChanged: (value){
              setState(() {
                distanceValue = value;
              });
            },
            max: 100,
            min: 1,
          ),
          SettingListTile(
            text: 'Show me',
            onTap: (){

            },
          ),
          RangeTile(
            title: 'Age Range',
            max: 40,
            min: 18,
            values: ageRange,
            doubleSlider: true,
            onChanged: (values){
              setState(() {
                ageRange = values;
              });
            },
          ),
          SwitchTile(
            value: global,
            text: 'Global',
            onChanged: (value){
              setState(() {
                global = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
