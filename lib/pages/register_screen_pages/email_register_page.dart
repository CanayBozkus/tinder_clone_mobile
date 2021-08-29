import 'package:flutter/material.dart';
import 'package:tinder_clone/models/models.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class EmailRegisterPage extends StatelessWidget {

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
                  'What\'s your email?',
                  style: K.registerScreenHeaderTextStyle,
                ),
                SizedBox(height: 20,),
                Text(
                  'Don\'t lose access to your account, verify your email',
                  style: K.registerScreenContentTextStyle,
                ),
                SizedBox(height: 70,),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: K.textFormFieldDecoration(hintText: 'Enter email'),
                    style: K.textFormFieldTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? value){
                      user.email = value;
                    },
                    validator: (String? value){
                      if(value == null){
                        return 'Please enter your email';
                      }

                      else if(value.isEmpty){
                        return 'Please enter your email';
                      }
                      RegExp regEx = RegExp(r'^(([a-zA-Z0-9\._-]+))@(([a-z0-9]+)\.)+([a-z]{2,3})$');
                      if(!regEx.hasMatch(value)){
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
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
                    if(_formKey.currentState?.validate() ?? false){
                      _formKey.currentState?.save();
                      FocusScope.of(context).unfocus();
                      context.read<GeneralProvider>().registrationProvider.nextPage();
                    }
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
