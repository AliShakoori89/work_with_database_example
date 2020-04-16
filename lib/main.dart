import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workwithdatabaseexample/SearchBar.dart';
import 'package:workwithdatabaseexample/ThirdPage.dart';
import 'package:workwithdatabaseexample/database.dart';
import 'DeletPage.dart';
import 'SecondPage.dart';

void main() => runApp(MyApp());

final mycontroller1 = TextEditingController();
final mycontroller2 = TextEditingController();
final mycontroller3 = TextEditingController();
final mycontroller4 = TextEditingController();
final mycontroller5 = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;
  var name = MyInput('Name');
  var lastname = MyInput('Laatname');
  var age = MyInput('Age');
  var email = MyInput('Email');
  var phonenumber = MyInput('Phone_Number');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Information '),
      ),
      body: SingleChildScrollView(
        child: Stack(
        children: <Widget>[
          new Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 35.0,bottom: 30.0),
            child: CircleAvatar(
              child: ClipOval(
                child: Image.network('https://www.w3schools.com/howto/img_avatar.png',fit: BoxFit.cover,),
              ),
              radius: 50.0,
            ),
          ),
          name,
          lastname,
          age,
          email,
          phonenumber,
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 600.0 , horizontal: 2.0),
                child: MyButton(name.getState(),lastname.getState(),age.getState(),email.getState(),phonenumber.getState()),
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 600.0 , horizontal: 2.0),
                  child: RaisedButton(
                    onPressed: (){
                      _query();
                    },
                    child: Text('Show'),

                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 600.0 , horizontal: 2.0),
                child: RaisedButton(onPressed:(){
                  _search();
                },
                  child: Text('Search'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 600.0 , horizontal: 2.0),
                child: RaisedButton(onPressed:(){
                  _delete();
                },
                  child: Text('Delete'),
                ),
              )
            ],
          )
    ]
      )
    )
    );
  }

  void _search() async{
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SearchBar()));
  }

  void _delete(){
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new DeletPage()));
  }

  void _query() async {
    List person;
    var text='';
    person = await dbHelper.getAllRecords();
    for (int i=0; i<person.length; i++){
      text += person[i].toString()+'\n' + '\n';

    }
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ThirdPage(text)));
  }

}

class MyInput extends StatefulWidget {
  final String hint;
  MyInput(this.hint);
  final MyInputState state = new MyInputState();

  MyInputState getState(){
    return state;
  }

  @override
  MyInputState createState() => state;
}

class MyInputState extends State<MyInput> {
  var controller = new TextEditingController();


  String getText(){
    return controller.text;
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener((){
      print('text: ${controller.text}');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 15.0 , right: 15.0),
      child: new TextField(
        maxLength: 30,
        controller: controller,
        decoration: InputDecoration(hintText: widget.hint,
//            prefixIcon: Icon(Icons.person),
          contentPadding: new EdgeInsets.only(left: 10.0),

        ),
      ),
    );
  }
}


class MyButton extends StatelessWidget {

  MyInputState __myInputState1;
  MyInputState __myInputState2;
  MyInputState __myInputState3;
  MyInputState __myInputState4;
  MyInputState __myInputState5;

  MyButton(this.__myInputState1,this.__myInputState2,this.__myInputState3,this.__myInputState4,this.__myInputState5);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new RaisedButton(onPressed: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SecondPage(__myInputState1.getText(),
            __myInputState2.getText(),__myInputState3.getText(),
            __myInputState4.getText(),__myInputState5.getText())));
      },
        child: Text('Summary'),
      ),
    );
  }
}

