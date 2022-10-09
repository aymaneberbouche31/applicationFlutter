import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {

   final Function(int) onChangedStep;

  TermScreen({Key? key, required this.onChangedStep}) : super(key: key);

  @override
  _TermScreenState createState() => _TermScreenState();
}



class _TermScreenState extends State<TermScreen> {
ScrollController _scrollController = new ScrollController();
bool _termsReaded = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController(); // Initialisation

    _scrollController.addListener(() {
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange){
          setState(() {
            _termsReaded = true;
          });
      }
    });
  }

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
                  onPressed: () => widget.onChangedStep(0),
                  
                  ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Mettre les conditions ici !',style: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,),),
  ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: !_termsReaded ? null :() => widget.onChangedStep(2),
                  child: Text(
                    'accept & continue'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ))));
  }
}
