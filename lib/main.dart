import 'package:application/screens/Password.dart';
import 'package:application/screens/guest/Auth.dart';
import 'package:application/screens/guest/Term.dart';
import 'package:application/screens/guest/Guest.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  //S'assurer que tout est bien executé pr lancer la suite, ce qui repond entre notre framework et moteur
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); //COnnecter notre code au fichier de configuration 

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aymane',
      home: GuestScreen(),
    );
  }
}