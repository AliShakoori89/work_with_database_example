import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workwithdatabaseexample/Person.dart';


class DatabaseHelper{

  static final _databaseName = 'MyDatabase.db';
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final ColumnId = '_id';
  static final ColumnName = 'name';
  static final ColumnLastname = 'lastname';
  static final ColumnAge = 'age';
  static final ColumnEmail = 'email';
  static final ColumnPhonenumber = 'phonenumber';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory =  await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , _databaseName);
    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);


  }

  Future _onCreate(Database db , int version) async {
    await db.execute('CREATE TABLE $table ( '
        '$ColumnId INTEGER PRIMARY KEY ,'
        ' $ColumnName TEXT NOT NULL ,'
        ' $ColumnLastname TEXT NOT NULL ,'
        ' $ColumnPhonenumber INTEGER ,'
        ' $ColumnAge INTEGER ,'
        ' $ColumnEmail TEXT)');

  }

  Future<int> insert (Map<String,dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List> getAllRecords() async{
    var MyClient = await instance.database;
    var result = await MyClient.rawQuery('SELECT * FROM my_table');
    return result;
  }

  Future closedb() async{
    var MyClient = await instance.database;
    return MyClient.close();
  }

  Future <Person> search(String id) async{
    var MyClient = await instance.database;
    var result = await MyClient.rawQuery('SELECT * FROM my_table WHERE $ColumnId = $id');
    return new Person.MaptoObject(result.first);
  }

   Future<int> Delete(String id) async{
    var MyClient = await instance.database;
    var result = MyClient.delete('my_table' , where: "$ColumnId=$id");
    return result;
   }

   Future<int> Update(Person person) async{
    var MyClient = await instance.database;
    var result = await MyClient.update('my_table', person.toMap(),where: "$ColumnId=?",whereArgs: [person.id]);
    return result;
   }


}


