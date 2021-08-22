import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserSexualOrientationForm extends StatelessWidget {
  const UserSexualOrientationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        'My sexual orientation is',
                        style: K.registerScreenHeaderTextStyle,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Select up to 3',
                        style: K.registerScreenContentTextStyle,
                      ),
                      SizedBox(height: 20,),
                      ...K.sexualOrientations.map((e){
                        return ListTile(
                          title: Text(
                            e,
                            style: K.registerScreenSubHeaderTextStyle,
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Palette.primaryColor,
                            size: 30,
                          ),
                          onTap: (){

                          },
                        );
                      }).toList(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Palette.primaryColor,
                      value: true,
                      onChanged: (value){},
                    ),
                    Text(
                      'Show my orientation on my profile',
                      style: K.registerScreenContentTextStyle,
                    )
                  ],
                ),
                SizedBox(height: 10,),
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
