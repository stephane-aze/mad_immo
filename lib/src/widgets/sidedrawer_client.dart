import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/home.dart';
import '../views/clients/mes_documents_view.dart';
import '../views/clients/my_schedule_page.dart';
import '../views/clients/profiles.dart';

class SideDrawerClient extends StatelessWidget {
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
            title: Text('Mes documents'),
            leading: Icon(Icons.folder),
            onTap: () => {goMyFolder(context)},
          ),
          ListTile(
            title: Text('Mes disponibilités'),
            leading: Icon(Icons.schedule),
            onTap: () => {goMySchedule(context)},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () => {toLogOut(context)},
          ),
        ],
      ),
    );
  }

}
void goMyFolder(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return MesDocumentsView();
      }
      ));
}
void goProfiles(context){
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return ProfilePage();
      }
      ));
}
void goMySchedule(context){
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return MySchedulePage();
      }
      ));
}
void toLogOut(context){
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context){
        return Home();
      }),
      (route) => false);
}