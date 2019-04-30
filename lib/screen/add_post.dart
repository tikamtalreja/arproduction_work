import 'package:akproduction/db/PostService.dart';
import 'package:akproduction/models/post.dart';

import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Post post = Post(0," ", " "," "," "," "," "," "," " );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add client details"),
        elevation: 0.0,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.name = val,
                  validator: (val){
                    if(val.isEmpty ){
                      return "title field cant be empty";
                    }else if(val.length > 26){
                      return "title cannot have more than 26 characters ";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.address = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "body field cant be empty";
                    }
                  },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Phone number 1",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.phone1 = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "number field cant be empty";
                    }
                  },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "phone number 2",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.phone2 = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "number field cant be empty";
                    }
                  },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.desc = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "description field cant be empty";
                    }
                  },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "collaboration Type",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.colb = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "collaboration field cant be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Venue",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.venue = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "venue field cant be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.time = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "date field cant be empty";
                    }
                  },
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        insertPost();
        Navigator.pop(context);
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
        tooltip: "add a client detail",),
    );
  }

  void insertPost() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
    }
  }



}
