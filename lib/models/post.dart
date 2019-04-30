import 'package:firebase_database/firebase_database.dart';
class Post{

  static const KEY = "key";
  static const DATE = "date";
  static const NAME = "name";
  static const ADDRESS = "address";
  static const PHONE1 = "phone1";
  static const PHONE2 = "phone2";
  static const DESC = "desc";
  static const COLB = "colb";
  static const VENUE = "venue";
  static const TIME = "time";


   int date;
   String key;
   String name;
   String address;
   String phone1;
   String phone2;
   String desc;
   String colb;
   String venue;
   String time;


  Post(this.date, this.name, this.address,this.phone1,this.phone2,this.colb,this.desc,this.time,this.venue);

//  String get key  => _key;
//  String get date  => _date;
//  String get title  => _title;
//  String get body  => _body;


  Post.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.address = snap.value[ADDRESS],
        this.date = snap.value[DATE],
        this.phone1 = snap.value[PHONE1],
        this.phone2 = snap.value[PHONE2],
        this.desc = snap.value[DESC],
        this.colb = snap.value[COLB],
        this.venue = snap.value[VENUE],
        this.time = snap.value[TIME],
        this.name = snap.value[NAME];

  Map toMap(){
    return { KEY: key,DATE: date,NAME: name,ADDRESS: address,PHONE1 :phone1,PHONE2:phone2,  
    COLB:colb,DESC: desc,TIME:time,
    VENUE :venue,
    };
  }
}