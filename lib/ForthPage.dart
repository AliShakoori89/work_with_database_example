import 'package:flutter/material.dart';

class ForthPage extends StatelessWidget {

  var text;
  var text1 = '';
  var text2 = '';
  var text3 ;
  var text4 = '';
  var text5 ;


  ForthPage(this.text,this.text1,this.text2,this.text3,this.text4,this.text5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Recordes'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(vertical: 50 , horizontal:  50),
                child: Text('ID:   $text\n\nName:   $text1\n\nLastname:   $text2\n\nAge:   $text3\n\nEmail:   $text4\n\nPhone Number:   $text5')
            )
          ],
        ),
      ),
    );
  }
}
