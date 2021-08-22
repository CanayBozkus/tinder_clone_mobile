import 'package:flutter/material.dart';

class K {
  static final countryPhoneCodes = List.generate(100, (int index) => index.toString()).toList();

  static const sexualOrientations = [
    'Straight',
    'Gay',
    'Lesbian',
    'Bisexual',
    'Asexual',
    'Pansexual',
    'Queer',
    'Other'
  ];

  static const passions = [
    'Cycling',
    'Outdoors',
    'Walking',
    'Cooking',
    'Working out',
    'Athlete',
    'Craft Beer',
    'Writer',
    'Politics',
    'Climbing',
    'Foodie',
    'Art',
    'Karaoke',
    'Yoga',
    'Blogging',
    'Disney',
    'Surfing',
    'Soccer',
    'Dog lover',
    'Cat lover',
    'Movies',
    'Swimming',
    'Hiking',
    'Running',
    'Music',
    'Fashion',
    'Vlogging',
    'Astrology',
    'Coffee',
    'Instagram',
    'DIY',
    'Board Games',
    'Environmentalism',
    'Dancing',
    'Volunteering',
    'Trivia',
    'Reading',
    'Tea',
    'Language Exchange',
    'Shopping',
    'Wine',
    'Travel',
  ];

  static const registerScreenHeaderTextStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  static const registerScreenSubHeaderTextStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const registerScreenContentTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: 16,
    fontWeight: FontWeight.w600
  );
}