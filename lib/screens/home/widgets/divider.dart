import 'package:flutter/material.dart';

import 'package:widle_studio_practical_test/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: kSpacingUnit / 2,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
      ),
    );
  }
}
