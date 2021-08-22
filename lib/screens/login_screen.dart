import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/register_screen.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Palette.primaryColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/tinder.png',
                    width: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'tinder',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      'By tapping Create Account or Sign In, you agree to our Terms.'
                          ' Learn how we proccess your data in our Privacy Policy and Cookies Policy.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 50,),
                    RoundedButton(
                      text: 'CREATE ACCOUNT',
                      theme: RoundedButtonTheme.white,
                      onPressed: (){
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                    ),
                    SizedBox(height: 20,),
                    RoundedButton(
                      text: 'SIGN IN',
                      theme: RoundedButtonTheme.primary,
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
