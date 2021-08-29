import 'package:flutter/material.dart';
import 'package:tinder_clone/models/models.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';

class PhoneRegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User user = context.read<GeneralProvider>().registrationProvider.user;
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
                Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          onChanged: (String? value){
                            user.countryCode = value;
                          },
                          value: '${K.countryCodes[0]['code']} ${K.countryCodes[0]['dial_code']}',
                          items: K.countryCodes.map((e){
                            return DropdownMenuItem<String>(
                              onTap: (){},
                              value: '${e['code']} ${e['dial_code']}',
                              child: Text(
                                '${e['code']} ${e['dial_code']}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: controller,
                          decoration: K.textFormFieldDecoration(hintText: 'Phone Number'),
                          style: K.textFormFieldTextStyle,
                          keyboardType: TextInputType.phone,
                          onSaved: (String? value){
                            user.phoneNumber = User.getCleanPhoneNumber(value!);
                          },
                          validator: (String? value){
                            if(value == null){
                              return 'Please enter your phone number';
                            }
                            else if(value.isEmpty){
                              return 'Please enter your phone number';
                            }

                            String cleanedNumber = User.getCleanPhoneNumber(value);
                            controller.text = cleanedNumber;
                            if(cleanedNumber.isEmpty){
                              return 'Please enter a valid phone number';
                            }

                            else if(cleanedNumber.length < 10){
                              return 'Phone number is too short';
                            }

                            else if(cleanedNumber.length > 10){
                              return 'Phone number is too long';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
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
                  if(_formKey.currentState?.validate() ?? false){
                    _formKey.currentState?.save();
                    FocusScope.of(context).unfocus();
                    context.read<GeneralProvider>().registrationProvider.nextPage();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
