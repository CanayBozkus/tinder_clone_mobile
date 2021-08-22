import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserNameForm extends StatelessWidget {
  const UserNameForm({Key? key}) : super(key: key);

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
                  'My first name is',
                  style: K.registerScreenHeaderTextStyle,
                ),
                CustomTextField(),
                SizedBox(height: 10,),
                Text(
                  'This is how it will appear in Tinder and you will not be able to change it',
                  style: K.registerScreenContentTextStyle,
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
