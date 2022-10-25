import 'package:application/UserModel.dart/UserModel.dart';
import 'package:application/screens/Password.dart';
import 'package:application/screens/guest/Auth.dart';
import 'package:application/screens/guest/Term.dart';
import 'package:application/services/UserService.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();

  List<Widget> _widgets = [];
  int _indexSelected = 0;

  late String _email;

// On initialise ce tableau quand on lance notre appli, pourquoi ? On va avoir besoin d'ajouter des methodes à une vue pour passer d'une vue à une autre

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Ajout des vues crée pour les instancier
    _widgets.addAll([
      AuthScreen(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }), // On rajoute la propriété onChangedStep dans notre widget d'authentification
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep: (index, value) => setState(() {
          if (index != null) {
            _indexSelected = index;
          }
          if(value != null){
            UserModel userModel = UserModel(
              email: _email, 
              password:value
              );
               print(userModel.toJson());
          };

         
        }),
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
