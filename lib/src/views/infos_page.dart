import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/Logo-madimmo_horizontal.png',width: 200,scale: 0.8, fit: BoxFit.cover),
              backgroundColor: Colors.black,
              toolbarHeight: 60,
              
            ),
        ///*drawer: SideDrawer(),
        body: Container(),
    );
  }
}
