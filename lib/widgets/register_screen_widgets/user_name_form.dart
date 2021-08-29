import 'package:flutter/material.dart';
import 'package:tinder_clone/models/models.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserNameForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User user = context.read<GeneralProvider>().registrationProvider.user;
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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: K.textFormFieldDecoration(),
                    style: K.textFormFieldTextStyle,
                    onSaved: (String? value){
                      user.name = value;
                    },
                    validator: (String? value){
                      if(value == null){
                        return 'Please enter your name';
                      }

                      else if(value.isEmpty){
                        return 'Please enter your name';
                      }

                      else if(value.contains(RegExp(r'[0-9]'))){
                        return 'Name cannot contain number';
                      }

                      return null;
                    },
                  ),
                ),
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
                if(_formKey.currentState?.validate() ?? false){
                  _formKey.currentState?.save();
                  FocusScope.of(context).unfocus();
                  context.read<GeneralProvider>().registrationProvider.nextPage();
                }
              },
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
