import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserBirthdayForm extends StatelessWidget {
  const UserBirthdayForm({Key? key}) : super(key: key);

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
                  'My birthday is',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      child: CustomTextField(
                        hintText: 'DD',
                      ),
                    ),
                    Text(
                      '/',
                      style: K.registerScreenSubHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 40,
                      child: CustomTextField(
                        hintText: 'MM',
                      ),
                    ),
                    Text(
                      '/',
                      style: K.registerScreenSubHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 60,
                      child: CustomTextField(
                        hintText: 'YYYY',
                      ),
                    ),
                    SizedBox(width: 20,)
                  ],
                ),
                SizedBox(height: 15,),
                Text(
                  'Your age will be public',
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
