import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_immo/src/views/clients/dashboard_user.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../intro_project.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Email",
          /*border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))*/),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Mot de passe",
          /*border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))*/),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).accentColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          goHomepage(context);
        },
        child: Text("Se connecter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final registerTextView = TextButton(
        child: Text("Vous n'avez pas de compte? Décrivez un projet",
        /*style: style.copyWith(
                color:Theme.of(context).accentColor,),*/
        ),
        onPressed: () {
          goCreateProject(context);
        }
    );

    return Scaffold(
      body: Center(
        child: Container(
          //color: Colors.black87,
          
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    "assets/images/Logo-madimmo-2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 25.0),
                emailField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                registerTextView,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void goCreateProject(context){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return IntroProject();
        }
        ));
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }
  void goHomepage(context){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => DashboardUser()));
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }
  void  writeLocal() async{
    //after the login REST api call && response code ==200
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', 'useremail@gmail.com');

  }
}