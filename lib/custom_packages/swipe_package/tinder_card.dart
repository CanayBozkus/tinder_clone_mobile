import 'enums.dart';

class TinderCard {
  final String header;
  final String bio;
  final List<String> images;
  TinderCardAction action = TinderCardAction.none;

  TinderCard({required this.header, required this.bio, required this.images});
}