import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/component/slider_bar.dart';
import 'package:mingle_mate_mobile/screens/create_profile.dart';
import 'package:mingle_mate_mobile/screens/home.dart';
import 'package:mingle_mate_mobile/screens/join.dart';
import 'package:mingle_mate_mobile/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/createProfile',

      routes: {
        '/login':(context) => LoginScreen(),
        '/join':(context) => JoinScreen(),
        '/home': (context) => HomeScreen(),
        '/createProfile' :(context) => CreateProfileScreen(),
      },
    );
  }
}