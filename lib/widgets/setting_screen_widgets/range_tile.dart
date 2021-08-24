import 'package:flutter/material.dart';
import 'package:tinder_clone/utilities/utilities.dart';

class RangeTile extends StatelessWidget {
  RangeTile({
    required this.title,
    required this.onChanged,
    this.doubleSlider = false,
    this.values = const RangeValues(1, 100),
    this.value = 5,
    required this.max,
    required this.min
  });
  final Function(dynamic) onChanged;
  final String title;
  final bool doubleSlider;
  final RangeValues values;
  final double value;
  final double max;
  final double min;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: K.settingsScreenTileTitleStyle,
                ),
              ),
              doubleSlider
                  ?
              RangeSlider(
                activeColor: Palette.primaryColor,
                inactiveColor: Colors.black26,
                values: values,
                max: max,
                min: min,
                onChanged: onChanged,
              )
                  :
              Slider(
                activeColor: Palette.primaryColor,
                inactiveColor: Colors.black26,
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Divider(
            height: 0.5,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}
