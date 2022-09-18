import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  TermScreen({Key? key}) : super(key: key);

  @override
  _TermScreenState createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'Terms & Conditions',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {}),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () => print('accept'),
                  child: Text(
                    'accept & continue'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0,),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            )));
  }
}
