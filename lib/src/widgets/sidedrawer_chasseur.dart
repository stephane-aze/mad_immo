import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/clients/mes_documents_view.dart';
import '../views/clients/profiles.dart';

class SideDrawerChasseur extends StatelessWidget {
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
            title: Text('Mes clients'),
            leading: Icon(Icons.person_search),
            onTap: () => {goMyClients(context)},
          ),
          ListTile(
            title: Text('Mes projets'),
            leading: Icon(Icons.person_search),
            onTap: () => {goMyProjets(context)},
          ),
          ListTile(
            title: Text('Mes biens'),
            leading: Icon(Icons.person_search),
            onTap: () => {goMyProjets(context)},
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
void goMyClients(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return MesDocumentsView();
      }
      ));
  //Navigate to home page and remove the intro screen history
}
void goMyProjets(BuildContext context) {
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

}