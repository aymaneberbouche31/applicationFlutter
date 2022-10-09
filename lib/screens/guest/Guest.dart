import 'package:application/screens/Password.dart';
import 'package:application/screens/guest/Auth.dart';
import 'package:application/screens/guest/Term.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
List<Widget> _widgets = [];
int _indexSelected = 0;

// On initialise ce tableau quand on lance notre appli, pourquoi ? On va avoir besoin d'ajouter des methodes à une vue pour passer d'une vue à une autre

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  //Ajout des vues crée pour les instancier 
    _widgets.addAll([
      AuthScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index),// On rajoute la propriété onChangedStep dans notre widget d'authentification
      ),
      TermScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}