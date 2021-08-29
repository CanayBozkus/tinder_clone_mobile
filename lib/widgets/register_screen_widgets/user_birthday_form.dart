import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserBirthdayForm extends StatelessWidget {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
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
                      width: 50,
                      child: TextFormField(
                        focusNode: _focusNode,
                        controller: _dayController,
                        keyboardType: TextInputType.number,
                        decoration: K.textFormFieldDecoration(hintText: 'DD'),
                        style: K.textFormFieldTextStyle,
                        onChanged: (String value){
                          if(value.length > 2){
                            _dayController.text = value.substring(0, 2);
                            _dayController.selection = TextSelection.fromPosition(TextPosition(offset: _dayController.text.length));
                            //_focusNode.nextFocus();
                          }
                        },
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    Text(
                      '/',
                      style: K.registerScreenSubHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: _monthController,
                        keyboardType: TextInputType.number,
                        decoration: K.textFormFieldDecoration(hintText: 'MM'),
                        style: K.textFormFieldTextStyle,
                        onChanged: (String value){
                          if(value.length == 2){
                            _focusNode.nextFocus();
                          }
                        },
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
                      ),
                    ),
                    Text(
                      '/',
                      style: K.registerScreenSubHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        controller: _yearController,
                        keyboardType: TextInputType.number,
                        decoration: K.textFormFieldDecoration(hintText: 'YYYY'),
                        style: K.textFormFieldTextStyle,
                        onSaved: (String? value){

                        },
                        validator: (String? value){

                        },
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
