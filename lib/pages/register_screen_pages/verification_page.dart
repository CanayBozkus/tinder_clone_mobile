import 'package:flutter/material.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

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
                  'My code is',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      '5556538537',
                      style: K.registerScreenContentTextStyle,
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.black45,
                      ),
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: K.textFormFieldDecoration(),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: RoundedButton(
                text: 'CONTINUE',
                theme: RoundedButtonTheme.primaryGradient,
                onPressed: (){
                  context.read<GeneralProvider>().registrationProvider.nextPage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
