import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRealty extends StatefulWidget {
  @override
  _DetailReatyState createState() => _DetailReatyState();
}

class _DetailReatyState extends State<DetailRealty> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [Container(
            child: IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: (){ 
                Navigator.of(context).pop();
              }
            ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text("title"),
            ),
            Text("description"),
            TextButton(
              onPressed: (){},
              child: Text("voir photos")
              ),
            ],
        )
        ,)
      ,);
  }
}
