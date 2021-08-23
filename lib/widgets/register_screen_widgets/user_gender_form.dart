import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserGenderForm extends StatelessWidget {
  const UserGenderForm({Key? key}) : super(key: key);

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
                  'I am a',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.unselected,
                  onPressed: (){},
                  text: 'WOMAN',
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.selected,
                  onPressed: (){},
                  text: 'MAN',
                ),
                SizedBox(height: 20,),
                RoundedButton(
                  theme: RoundedButtonTheme.unselected,
                  onPressed: (){},
                  text: 'MORE',
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
                context.read<GeneralProvider>().registrationProvider.nextPage();
              },
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
