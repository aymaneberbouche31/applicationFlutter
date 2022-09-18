import 'package:application/screens/guest/Auth.dart';
import 'package:application/screens/guest/Term.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aymane',
      home: TermScreen(),
    );
  }
}