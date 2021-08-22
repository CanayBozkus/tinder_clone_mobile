import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/main_screen.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class UserPhotoForm extends StatelessWidget {
  const UserPhotoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double photoContainerWidth = (width - 50) / 3;
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Add Photos',
                style: K.registerScreenHeaderTextStyle,
              ),
              SizedBox(height: 15,),
              Text(
                'Add at least 2 photo to continue',
                style: K.registerScreenContentTextStyle,
              ),
              SizedBox(height: 30,),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ...List.generate(6, (index){
                    return Container(
                      height: photoContainerWidth * 1.5,
                      width: photoContainerWidth,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ],
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
              Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (Route<dynamic> route) => false);
            },
          ),
        ),
        SizedBox(height: 50,),
      ],
    );
  }
}
