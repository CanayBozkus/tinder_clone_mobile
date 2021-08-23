import 'package:flutter/material.dart';
import 'package:tinder_clone/screens/screens.dart';
import 'package:tinder_clone/utilities/utilities.dart';
import 'package:tinder_clone/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade50,
      child: Column(
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              padding: const EdgeInsets.only(bottom: 2),
              color: Colors.grey.shade300,
              child: ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          offset: Offset(-10, -10),
                          spreadRadius: 5.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 80,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/img/fake_img_1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nadia, 25',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2
                            ),
                          ),
                          SizedBox(width: 15,),
                          Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.black26,
                            size: 28,
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      SizedBox(
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                ElevatedCircleIconButton(
                                  icon: Icons.settings,
                                  backgroundColor: Colors.grey.shade200,
                                  iconColor: Colors.black26,
                                  iconSize: 44,
                                  onPressed: (){
                                    Navigator.pushNamed(context, SettingScreen.routeName);
                                  },
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  'SETTINGS',
                                  style: K.profilePageButtonInfoTextStyle,
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  children: [
                                    ElevatedCircleIconButton(
                                      icon: Icons.camera_alt_rounded,
                                      backgroundColor: Palette.primaryColor,
                                      iconColor: Colors.white,
                                      splashColor: Colors.white,
                                      iconSize: 44,
                                      onPressed: (){},
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Material(
                                        elevation: 5,
                                        shape: CircleBorder(),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Palette.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  'ADD MEDIA',
                                  style: K.profilePageButtonInfoTextStyle,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedCircleIconButton(
                                  icon: Icons.edit,
                                  backgroundColor: Palette.orange,
                                  iconColor: Colors.white,
                                  splashColor: Colors.white,
                                  iconSize: 44,
                                  onPressed: (){},
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  'EDIT INFO',
                                  style: K.profilePageButtonInfoTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 36,
                    ),
                    Text(
                      'Stand out with Super Likes',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  'You\'re 3 times more likely to get a match!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(7, (index){
                      return Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == 2 ? Colors.blue : Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          width: 8,
                          height: 8,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundedButton(
                    theme: RoundedButtonTheme.selected,
                    onPressed: (){},
                    text: 'MY TINDER PLUS',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width/2, size.height + 40, size.width, size.height-50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
