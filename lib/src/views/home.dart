import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_immo/src/utils/connection_status_internet.dart';
import 'package:mad_immo/src/views/partners_page.dart';

import '../intro_project.dart';
import 'infos_page.dart';
import 'login/login.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createProject = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow, //Theme.of(context).accentColor,
        child: MaterialButton(
          onPressed: () {
            goFormCreate(context);
          },
          child: Text(
            "Décrire son projet",
            textAlign: TextAlign.center,
            //style: TextStyle(color: Colors.white) ,
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Logo-madimmo_horizontal.png',
            width: 200, scale: 0.8, fit: BoxFit.cover),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(15),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.yellow[100], //Theme.of(context).accentColor,
                child: MaterialButton(
                  textColor: Colors.black,
                  //onPressed: () {},
                  child: Text('Espace client'),
                  onPressed: () => {goLogin(context)},
                  //borderRadius: BorderRadius.circular(30.0),
                ),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Accueil'),
              onTap: () => {goHome(context)},
            ),
            ListTile(
              title: Text('Nos services'),
              onTap: () => {goInformationsPage(context)},
            ),
            ListTile(
              title: Text('Nos partenaires'),
              onTap: () => {goPartnersPage(context)},
            ),
            ListTile(
              title: Text('Nos Tarifs'),
              onTap: () => {},
            ),
            ListTile(
              title: Text('Nous rejoindre'),
              onTap: () => {},
            ),
            ListTile(
              title: Text('Nous contacter'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 260,
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                  "Mad'immobilier est un service qui veut vous faciliter la vie.")),
          createProject
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat,
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
        onPressed: () {
          openDialog();
        },
      ),
    );
  }
}

void goPartnersPage(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return PartnersPage();
  }));
}

void goHome(context) {
  Navigator.of(context).pop();
}

void goInformationsPage(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return InfosPage();
  }));
}

void goFormCreate(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return IntroProject();
  }));
  //Navigate to home page and remove the intro screen history
  //so that "Back" button wont work.
}

void goLogin(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return LoginPage();
  }));
}

void openDialog() {
  print("Hello");
}
