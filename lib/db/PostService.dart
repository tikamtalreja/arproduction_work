import 'package:firebase_database/firebase_database.dart';


class PostService{
  String nodeName = "posts";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  Map post;

  PostService(this.post);

  addPost(){
//    this is going to give a reference to the posts node
   database.reference().child(nodeName).push().set(post);
  }

  deletePost(){
    database.reference().child('$nodeName/${post['key']}').remove();
  }

  updatePost(){
    database.reference().child('$nodeName/${post['key']}').update(
      {"name": post['name'], "address": post['address'], "date":post['date'],"time":post['time'],"phone1":post['phone1'],
      "phone2":post['phone2'],"colb":post['colb'],"desc":post['desc'],"venue":post['venue']}
    );
  }
}