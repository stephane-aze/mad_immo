import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_immo/src/widgets/sidedrawer_admin.dart';



class DashboardAdmin extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawerAdmin(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.white,
          onPressed: () {
             _scaffoldKey.currentState.openDrawer();
          },
        ),/**/
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,

              ),
              Padding(padding: EdgeInsets.all(30),
              child: Text("Tableau de bord",style: TextStyle(fontSize: 40),),),

            ]
        ),
      ),
      
    );

  }

}
void openDialog(){
  print("Hello");
}