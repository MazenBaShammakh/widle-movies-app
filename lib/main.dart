import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/movie/movie_screen.dart';

import 'providers/auth.dart';
import 'providers/movies.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Movies(),
        ),
      ],
      child: MaterialApp(
        title: 'Widle Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: kMaterialColor,
        ),
        initialRoute: AuthScreen.routeName,
        routes: {
          AuthScreen.routeName: (_) => const AuthScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          MovieScreen.routeName: (_) => const MovieScreen(),
        },
      ),
    );
  }
}
