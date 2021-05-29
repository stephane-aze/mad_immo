import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/clients/mes_documents_view.dart';
import '../views/clients/profiles.dart';

class SideDrawerManager extends StatelessWidget {
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
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () => {Navigator.of(context).pop()},
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
  //Navigate to home page and remove the intro screen history
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