import 'package:akproduction/db/PostService.dart';
import 'package:akproduction/models/post.dart';
import 'package:akproduction/screen/home.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  final Post post;

  EditPost(this.post);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final GlobalKey<FormState> formkey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit client details"),
        elevation: 0.0,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.post.name,
                  decoration: InputDecoration(
                      labelText: "name",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.name = val,
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
                  initialValue: widget.post.address,
                  decoration: InputDecoration(
                      labelText: "address",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.address = val,
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
                  initialValue: widget.post.phone1,
                  decoration: InputDecoration(
                      labelText: "phone number 1",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.phone1 = val,
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
                  initialValue: widget.post.phone2,
                  decoration: InputDecoration(
                      labelText: "phone number 2",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.phone2 = val,
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
                  initialValue: widget.post.desc,
                  decoration: InputDecoration(
                      labelText: "description",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.desc = val,
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
                  initialValue: widget.post.colb,
                  decoration: InputDecoration(
                      labelText: "collaboration",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.colb = val,
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
                  initialValue: widget.post.venue,
                  decoration: InputDecoration(
                      labelText: "Venue",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.venue = val,
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
                  initialValue: widget.post.time,
                  decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => widget.post.time = val,
                  validator: (val){
                    if(val.isEmpty){
                      return "Date field cant be empty";
                    }
                  },
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        insertPost();
//        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
        child: Icon(Icons.edit, color: Colors.white,),
        backgroundColor: Colors.red,
        tooltip: "exit from edit",),
    );
  }

  void insertPost() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      widget.post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(widget.post.toMap());
      postService.updatePost();
    }
  }


}
