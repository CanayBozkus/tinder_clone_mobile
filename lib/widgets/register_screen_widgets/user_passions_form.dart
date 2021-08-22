import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserPassionsForm extends StatelessWidget {
  const UserPassionsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: RawScrollbar(
              thumbColor: Palette.primaryColor,
              radius: Radius.circular(10),
              isAlwaysShown: true,
              child: ListView(
                padding: const EdgeInsets.only(right: 5),
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      ...K.passions.map((e){
                        return RoundedButton(
                          onPressed: (){},
                          text: e,
                          minWidth: true,
                          fontSize: 18,
                          theme: RoundedButtonTheme.unselected,
                        );
                      }).toList(),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RoundedButton(
              text: 'CONTINUE (0/5)',
              theme: RoundedButtonTheme.primaryGradient,
              onPressed: (){
                context.read<RegistrationProvider>().nextPage();
              },
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
