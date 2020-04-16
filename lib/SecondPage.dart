import 'package:flutter/material.dart';

import 'database.dart';

class SecondPage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  var name='';
  var lastname='';
  var age = '';
  var email='';
  var phonenumber='';

  SecondPage(this.name,this.lastname,this.age,this.email,this.phonenumber);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text('Second Page'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
          child: Text(name, style: TextStyle(fontSize: 20.0),),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
          child: Text(lastname, style: TextStyle(fontSize: 20.0),),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
            child: Text(age, style: TextStyle(fontSize: 20.0),),
          )
          ,
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
            child: Text(email, style: TextStyle(fontSize: 20.0),),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
            child: Text(phonenumber, style: TextStyle(fontSize: 20.0),),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0 , horizontal: 25.0),
              child: Center(
                child: RaisedButton(
                  onPressed: (){
                    _insert();
                  },
                  child: Text('Save'),
                ),
              )
          ),

        ],
      ),
    );
  }

  void _insert() async{
    Map<String,dynamic> row = {
      DatabaseHelper.ColumnName : '$name',
      DatabaseHelper.ColumnLastname : '$lastname',
      DatabaseHelper.ColumnAge : '$age',
      DatabaseHelper.ColumnEmail : '$email',
      DatabaseHelper.ColumnPhonenumber : '$phonenumber',
    };

    final id = await dbHelper.insert(row);
    print('inserted row : $id');
  }
}

