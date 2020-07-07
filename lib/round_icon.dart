import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  RoundIcon({this.child, this.onTap});

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 46, height: 46),
      shape: CircleBorder(),
      onPressed: onTap,
    );
  }
}
