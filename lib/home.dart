import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_immo/form_create_project.dart';
import 'package:mad_immo/profiles.dart';

class Home extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final createProject = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: () {
          goFormCreate(context);
        },
        child: Text("Créer son projet",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white) ,
        ),
      )
    );
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.black,
          onPressed: () {
             _scaffoldKey.currentState.openDrawer();
          },
        ),/**/
      ),
      body: /*SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,

              ),
              createProject,

            ]
        ),
      ),*/
      Center(
          child: createProject,
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

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
                accountName:  Text("Blabla bla"),
                accountEmail: Text("bla.blabla@gmail.com"),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white)
                    ),

                ),
                decoration: BoxDecoration(color: Colors.black),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () => {goProfiles(context)},
          ),
          ListTile(
            title: Text('Mes projets'),
            leading: Icon(Icons.folder),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
void goFormCreate(context){
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context){
        return FormCreateProject();
      }
      ), (Route<dynamic> route) => false);
  //Navigate to home page and remove the intro screen history
  //so that "Back" button wont work.
}
void goProfiles(context){
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return ProfilePage();
      }
      ));
  //Navigate to home page and remove the intro screen history
  //so that "Back" button wont work.
}
void openDialog(){
  print("Hello");
}