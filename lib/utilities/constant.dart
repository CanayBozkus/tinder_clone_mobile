import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/palette.dart';

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

  static const profilePageButtonInfoTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black38
  );

  static const settingScreenInfoTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Palette.primaryColor,
  );

  static const settingsScreenTileTitleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600
  );
}