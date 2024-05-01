import 'package:flutter/material.dart';

class CustomText {
  static Text titleText({
    required txt,
    double? size,
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size ?? 30,
        fontWeight: FontWeight.w600,
        fontFamily: 'PlayfairDisplay',
        color: color,
      ),
      overflow: TextOverflow.visible,
      textAlign: textAlign,
    );
  }

  static Text subHeadText({
    required txt,
    double? size,
  }) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size ?? 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Raleway',
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text body1Text({
    required txt,
    double? size,
  }) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size ?? 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }
}
