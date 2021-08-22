import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserGenderPreferencesForm extends StatelessWidget {
  const UserGenderPreferencesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Show me',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.unselected,
                  onPressed: (){},
                  text: 'WOMEN',
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.selected,
                  onPressed: (){},
                  text: 'MEN',
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.unselected,
                  onPressed: (){},
                  text: 'EVERYONE',
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RoundedButton(
              text: 'CONTINUE',
              theme: RoundedButtonTheme.primaryGradient,
              onPressed: (){
                context.read<RegistrationProvider>().nextPage();
              },
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
