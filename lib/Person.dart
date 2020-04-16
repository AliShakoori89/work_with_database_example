class Person{
  int _id;
  String _name;
  String _lastname;
  int _age;
  String _email;
  int _phonenumber;

  Person(this._id,this._name,this._lastname,this._age,this._email,this._phonenumber);

  Person.Map(dynamic Person){
    this._id = Person['_id'];
    this._name =Person['name'];
    this._lastname = Person['lastname'];
    this._age = Person['age'];
    this._email = Person['email'];
    this._phonenumber = Person['phonenumber'];
  }
  Person.MaptoObject(Map<String,dynamic> map){
    this._id = map['_id'];
    this._name = map['name'];
    this._lastname = map['lastname'];
    this._age = map['age'];
    this._email=map['email'];
    this._phonenumber = map['phonenumber'];
  }


  int get id => _id;
  String get name => _name;
  String get lastname => _lastname;
  int get age => _age;
  String get email => _email;
  int get phonenumber => _phonenumber;


  set id(int value) {
    _id = value;
  }

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['_id'] = this._id;
    map['name'] = this._name;
    map['lastname'] = this._lastname;
    map['age'] = this._age;
    map['email'] = this._email;
    map['phonenumber'] = this._phonenumber;

    if (_id!=null){
      map['_id'] = this._id;
    }
    return map;
  }
}