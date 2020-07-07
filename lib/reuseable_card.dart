import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReuseableWidget({@required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
