import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key, this.email}) : super(key: key);

  final String email;
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final snackBar = SnackBar(content: Text('Un mail a été envoyé'));
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        hintText: "Email",
        /*border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))*/
      ),
    );
    final forgotPasswordButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.yellow[400],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          sendEmailForPassword(emailController.text, context);
        },
        child: Text("Envoyer un mail",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
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
                  child: Text(
                        'Vous allez recevoir un mail à l\'adresse mail indiqué. Etes-vous sûr de poursuivre l\'opération?',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                ),
                SizedBox(height: 25.0),
                emailField,
                SizedBox(
                  height: 35.0,
                ),
                forgotPasswordButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendEmailForPassword(String email, context) {
    print(email);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
