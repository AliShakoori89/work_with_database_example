import 'package:flutter/material.dart';



class ThirdPage extends StatelessWidget {

  var text;

  ThirdPage(this.text);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('All Recordes'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(vertical: 50 , horizontal:  50),
            child: Text('$text')
            )
          ],
        ),
      ),
    );
  }
}
