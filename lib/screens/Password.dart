import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const PasswordScreen({super.key, required this.onChangedStep});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = '';
  bool _isSecret = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
              titleSpacing: 0.0,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                '',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () => widget.onChangedStep(0),
                  ),
            ),
      body : Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
             child : Column(children: [
            Text("password".toUpperCase(),
            style: TextStyle(
              fontSize: 30.0
              ),
            ),
            SizedBox(height : 50.0),
            Form(
            key: _formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter your password'),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              onChanged: (value) => setState(()  {
                _password = value;
              }),
              validator: (value) => value != null && value.length < 6 
              ? "Enter a password. 6 caracters min required." 
              : null,
              obscureText: _isSecret,
              decoration: InputDecoration(
                suffixIcon: InkWell(// Permet d'avoir comportement OnTap, sur tel mobile c'est du tap avec ton doigt
                  onTap: () => setState(() {
                    _isSecret = !_isSecret;
                  }),
                  child: Icon(!_isSecret ? Icons.visibility : Icons.visibility_off),
                ), 
                  hintText: 'Ex : gh!D4Yhd',
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

              onPressed: _password.length < 6 ? null : (){
                if(_formKey.currentState!.validate()){
                  print(_password);
                }
              },
              child: Text(
                'continue'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ))
          ],
            )
          ),
          
        )
      )
      );
  }
}