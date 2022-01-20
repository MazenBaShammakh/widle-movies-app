import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF003049);
const Color kSecondaryColor = Color(0xFFf77f00);
const Color kNeutralDark = Color(0xFF000418);
const Color kNeutralGrey = Color(0xFFeae2b7);
const Color kNeutralLight = Color(0xFFF3F5FF);
const Color kError = Color(0xFFd62828);

final kShadowColor = const Color(0xFF000000).withOpacity(.25);
final kBoxShadow = BoxShadow(
  color: kShadowColor,
  blurRadius: 2.0,
  spreadRadius: 2.0,
);

const double kSpacingUnit = 8.0;

Map<int, Color> _materialColor = {
  50: kPrimaryColor.withOpacity(.1),
  100: kPrimaryColor.withOpacity(.2),
  200: kPrimaryColor.withOpacity(.3),
  300: kPrimaryColor.withOpacity(.4),
  400: kPrimaryColor.withOpacity(.5),
  500: kPrimaryColor.withOpacity(.6),
  600: kPrimaryColor.withOpacity(.7),
  700: kPrimaryColor.withOpacity(.8),
  800: kPrimaryColor.withOpacity(.9),
  900: kPrimaryColor.withOpacity(1)
};

MaterialColor kMaterialColor =
    MaterialColor(kPrimaryColor.value, _materialColor);
