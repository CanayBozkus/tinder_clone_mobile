import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';

class PhoneRegisterPage extends StatelessWidget {
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
                  'My number is',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                Text(
                  'We will send a text with a verification code. Message and data rates may'
                      'apply. Learn what happens when your number changes.',
                  style: K.registerScreenContentTextStyle,
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        onChanged: (String? value){},
                        value: K.countryPhoneCodes[0],
                        items: K.countryPhoneCodes.map((e){
                          return DropdownMenuItem(
                            onTap: (){},
                            value: e,
                            child: Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        hintText: 'Phone Number',
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
                  context.read<RegistrationProvider>().nextPage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
