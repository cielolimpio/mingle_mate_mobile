import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/screens/join.dart';
import 'package:mingle_mate_mobile/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: JoinScreen());
  }
}