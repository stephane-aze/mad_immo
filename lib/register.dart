import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Mot de passe",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final numeroField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Numéro",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final nameField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Nom",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final firstnameField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          hintText: "Prénom",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Créer son compte",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 45.0,
                  child: Text("Création de compte",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 0.15,
                      color: Colors.blue
                    )
                  )
                ),
                SizedBox(height: 20.0),
                nameField,
                SizedBox(height: 20.0),
                firstnameField,
                SizedBox(height: 20.0),
                emailField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 20.0),
                numeroField,
                SizedBox(
                  height: 30.0,
                ),
                registerButton,
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
}