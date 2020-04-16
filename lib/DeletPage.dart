import 'package:flutter/material.dart';

import 'database.dart';


class DeletPage extends StatefulWidget {
  @override
  _DeletPageState createState() => _DeletPageState();
}

class _DeletPageState extends State<DeletPage> {
  var controller = new TextEditingController();
  var text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(
              vertical: 50.0, horizontal: 30.0),
            child: TextField(
              maxLength: 25,
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(
              vertical: 20.0, horizontal: 30.0),
            child: RaisedButton(onPressed: () {
              deleteID();
            },
              child: Text('Delete'),
            ),
          ),
//          Padding(padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
//            child: Text('text:$text'),
//          )
        ],
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      print('text: ${controller.text}');
    });
  }

  void deleteID() async {
    var field = controller.text;
    final dbHelper = DatabaseHelper.instance;
    var st = await dbHelper.Delete(field);
//    text = st.id;
//    print(text);
//    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ForthPage(text,text1,text2,text3,text4,text5)));
  }
}
