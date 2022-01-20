import 'package:flutter/material.dart';

import 'package:widle_studio_practical_test/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        color: kNeutralDark,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
