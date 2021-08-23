import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
class TermsAgreementPage extends StatelessWidget {

  Widget _term({required String header, required String content}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.check,
              color: Palette.primaryColor,
              size: 36,
            ),
            SizedBox(width: 10,),
            Text(
              header,
              style: K.registerScreenSubHeaderTextStyle,
            )
          ],
        ),
        SizedBox(height: 10,),
        Text(
          content,
          style: K.registerScreenContentTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/img/tinder.png',
                width: 60,
              ),
              SizedBox(height: 10,),
              Text(
                'Welcome to Tinder',
                style: K.registerScreenHeaderTextStyle,
              ),
              SizedBox(height: 10,),
              Text(
                'Please follow these House Rules.',
                style: K.registerScreenContentTextStyle,
              ),
              SizedBox(height: 10,),
              _term(
                header: 'Be yourself.',
                content: 'Make sure your photos, age, and bio are true to who you are.',
              ),
              SizedBox(height: 10,),
              _term(
                header: 'Stay safe.',
                content: 'Don\'t be too quick to give out personal information. Date Safely',
              ),
              SizedBox(height: 10,),
              _term(
                header: 'Play it cool.',
                content: 'Respect others and treat them as you would like to be treated.',
              ),
              SizedBox(height: 10,),
              _term(
                header: 'Be proactive.',
                content: 'Always report bad behavior.',
              ),
            ],
          ),
          RoundedButton(
            text: 'I AGREE',
            theme: RoundedButtonTheme.primary,
            onPressed: (){
              context.read<GeneralProvider>().registrationProvider.nextPage();
            },
          )
        ],
      ),
    );
  }
}
