import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_immo/src/widgets/sidedrawer_client.dart';



class DashboardUser extends StatelessWidget{
  //final String currentUserId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawerClient(),
      appBar: AppBar(
              title: Image.asset('assets/images/Logo-madimmo_horizontal.png',width: 200,scale: 0.8, fit: BoxFit.cover),
              backgroundColor: Colors.black,
              toolbarHeight: 60,
              
            ),/*AppBar(
        backgroundColor: Colors.black87,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.white,
          onPressed: () {
             _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),*/
      body: 
      Container(
          child: Column(
            children: [
              Padding(
                child:Text("Notifications"),
                padding: EdgeInsets.all(30),
              ),
              //ListView(),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed:(){
          openDialog();
        },
      ),
    );
  }

}

void openDialog(){
  print("Hello");
}