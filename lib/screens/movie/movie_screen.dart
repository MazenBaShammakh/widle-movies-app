import 'package:flutter/material.dart';

import 'widgets/body.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  static const routeName = '/movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}
