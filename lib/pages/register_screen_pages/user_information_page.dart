import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'package:tinder_clone/widgets/register_screen_widgets/register_screen_widgets.dart';

class UserInformationPage extends StatelessWidget {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RawScrollbar(
            interactive: false,
            controller: _controller,
            thumbColor: Palette.primaryColor,
            radius: Radius.circular(10),
            isAlwaysShown: true,
            child: PageView(
              controller: _controller,
              children: [
                UserNameForm(),
                UserBirthdayForm(),
                UserGenderForm(),
                UserSexualOrientationForm(),
                UserGenderPreferencesForm(),
                UserPassionsForm(),
                UserPhotoForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
