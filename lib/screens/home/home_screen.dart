import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widle_studio_practical_test/constants.dart';

import 'package:widle_studio_practical_test/providers/auth.dart';
import 'package:widle_studio_practical_test/providers/movies.dart';

import 'package:widle_studio_practical_test/screens/auth/auth_screen.dart';

import 'widgets/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    Provider.of<Movies>(context, listen: false).fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? username = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
              child: Text(
                'Log out',
                style: TextStyle(
                  color: kNeutralLight,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Body(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kPrimaryColor.withOpacity(.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
