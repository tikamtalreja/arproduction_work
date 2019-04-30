import 'package:akproduction/models/post.dart';

import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;
class CardPostView extends StatefulWidget {
   final Post post;

  CardPostView(this.post);
  @override
  _CardPostViewState createState() => _CardPostViewState();
}

class _CardPostViewState extends State<CardPostView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.name),
      ),
      body: AlertDialog(
              content: Card(
                child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.post.date)),
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),),
                  
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("Address: "),
                    Text(widget.post.address),
                  ],
                )
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
               child: Row(
                  children: <Widget>[
                    Text("number 1: "),
                    Text(widget.post.phone1),
                  ],
                )
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("number 2: "),
                    Text(widget.post.phone2),
                  ],
                )
               ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("venue: "),
                    Text(widget.post.venue),
                  ],
                )
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("date: "),
                    Text(widget.post.time),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("Descprition: "),
                    Text(widget.post.desc),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("collaboration: "),
                    Text(widget.post.colb),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}