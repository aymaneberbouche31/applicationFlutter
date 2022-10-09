import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  AuthScreen({Key? key, required this.onChangedStep}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

late String _email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        RichText(
          text: TextSpan(
            text: 'Everyone has\n'.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
            children: [
              TextSpan(
                text: 'knowledge\n'.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'to share'.toUpperCase()),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'It all starts here.',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Form(
          key: _formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter your email'),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              validator: (value) =>
                value != null && (value.isEmpty || !emailRegex.hasMatch(value)) 
                ? 'Please enter a valid email' 
                : null,
              //Quand le formulaire va changer, on effectue une action
              onChanged: (value) => setState(() {
                _email = value; // On set la propriété
              }),
              decoration: InputDecoration(
                  hintText: 'Ex : john.doe@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(color: Colors.grey),
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: !emailRegex.hasMatch(_email) ? null : (){
                if(_formKey.currentState!.validate()){
                  print(_email);
                  widget.onChangedStep(1);
                }
              },
              child: Text(
                'continue'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ))
      ])),
    )));
  }
}
