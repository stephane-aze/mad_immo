import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_immo/src/views/clients/creation_project/profiles_for_project/form_profile_for_project.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroProject extends StatefulWidget {
  @override
  _IntroProjectState createState() => _IntroProjectState();
}

class _IntroProjectState extends State<IntroProject> {
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        /*appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Création de projet Achat'),
          centerTitle: true,
        ),*/
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(36.0),
            child:Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: Text('Bienvenue',
                                style: TextStyle(
                                        fontSize: width *0.1,
                                        color: Colors.black)),
                                        )
                ),
                SizedBox(height: 30,),
                Text("Nous sommes très heureux de pouvoir participer à la réalisation de votre projet immobilier et de vous accompagner de la meilleure façon possible pour pouvoir le concrétiser.", 
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 20)
                    ),
                SizedBox(height: 20,),
                Text("Une fois le formulaire remplis, vous serez recontacté par un chasseur immobilier.\n(Consultation gratuite et sans engagement).\n", style: TextStyle(color: Colors.black, fontSize: 18)),
                Text('Es-tu prêt pour la création de ton projet?\n Allons-y!', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: width *0.05)
                ),

                SizedBox(height: 50),
                MaterialButton(onPressed: () {
                                    goContinue(context);
                              },color: Colors.yellow[200],
                              child: Text("Continuer"),)
              ],
            )
          )
        )
    );
  }
  void goContinue(context){
    Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return ProfileForProject();
            })
    );
  }
}
