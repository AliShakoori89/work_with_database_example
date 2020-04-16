import 'package:flutter/material.dart';
import 'ForthPage.dart';
import 'database.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var controller = new TextEditingController();
  var text;
  var text1 = '';
  var text2 = '';
  var text3;
  var text4 = '';
  var text5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(vertical: 50.0 , horizontal: 30.0),
          child: TextField(
            maxLength: 25,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search)
            ),
          ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
            child: RaisedButton(onPressed: (){
              searchID();
            },
              child: Text('Search'),
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
    controller.addListener((){
      print('text: ${controller.text}');
    });
  }

  void searchID() async{
    var field = controller.text;
    final dbHelper = DatabaseHelper.instance;
    var st = await dbHelper.search(field);
    text = st.id;
    text1 = st.name;
    text2 = st.lastname;
    text3 = st.age;
    text4 = st.email;
    text5 = st.phonenumber;

    print(text);
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ForthPage(text,text1,text2,text3,text4,text5)));
  }

}
