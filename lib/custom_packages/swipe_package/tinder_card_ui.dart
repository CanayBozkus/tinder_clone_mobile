import 'package:flutter/material.dart';
import 'package:tinder_clone/custom_packages/swipe_package/swipe_package.dart';

class TinderCardUI extends StatelessWidget {
  final TinderCard card;
  TinderCardUI({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                card.images[0],
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: SizedBox(
                height: 10,
                child: Row(
                  children: [
                    ...List.generate(3, (index){
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Container(
                            height: 4,
                            width: 10,
                            decoration: BoxDecoration(
                                color: index == 0 ? Colors.white : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                      spreadRadius: 5
                                  )
                                ]
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        card.header,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.expand_more_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    card.bio,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      wordSpacing: 3,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
