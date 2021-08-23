import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class EmailRegisterPage extends StatelessWidget {
  const EmailRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  'What\'s your email?',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                Text(
                  'Don\'t lose access to your account, verify your email',
                  style: K.registerScreenContentTextStyle,
                ),
                SizedBox(height: 70,),
                CustomTextField(
                  hintText: 'Enter email',
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                RoundedButton(
                  text: 'CONTINUE',
                  theme: RoundedButtonTheme.primaryGradient,
                  onPressed: (){
                    context.read<GeneralProvider>().registrationProvider.nextPage();
                  },
                ),
                SizedBox(height: 10,),
                Text(
                  'OR',
                ),
                SizedBox(height: 10,),
                RoundedButton(
                  text: 'SIGN IN WITH GOOGLE',
                  onPressed: (){

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
