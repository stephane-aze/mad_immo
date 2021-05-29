import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../create_project_achat.dart';
import '../create_project_investissement.dart';
import '../create_project_location.dart';

class ProfileForProject extends StatefulWidget {
  @override
  _ProfileForProjectState createState() => _ProfileForProjectState();
}

class _ProfileForProjectState extends State<ProfileForProject> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int _value = 1;
  List<String> listItemsChoiceProject = ['Achat', 'Location', 'Investissement'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<DropdownMenuItem> itemsProfileStep1 = [
      DropdownMenuItem(child: Text("•	Célibataire"), value: 1),
      DropdownMenuItem(child: Text("•	Marié(e)"), value: 2),
      DropdownMenuItem(child: Text("•	Pacsé(e)"), value: 3),
      DropdownMenuItem(child: Text("•	Divorcé(e)"), value: 4),
      DropdownMenuItem(child: Text("•	Veuf(ve)"), value: 5),
      DropdownMenuItem(child: Text("•	Autre"), value: 6),
    ];
    List<DropdownMenuItem> itemsProfileStep2 = [
      DropdownMenuItem(child: Text("Pas d'enfants"), value: 1),
      DropdownMenuItem(child: Text("1"), value: 2),
      DropdownMenuItem(child: Text("2"), value: 3),
      DropdownMenuItem(child: Text("3"), value: 4),
      DropdownMenuItem(child: Text("Plus de 3"), value: 5),
    ];
    List<DropdownMenuItem> itemsProfileStep3 = [
      DropdownMenuItem(child: Text("CDD"), value: 1),
      DropdownMenuItem(child: Text("CDI"), value: 2),
      DropdownMenuItem(child: Text("Indépendant"), value: 3),
      DropdownMenuItem(child: Text("CTT"), value: 4),
      DropdownMenuItem(child: Text("Contrat d'apprentissage"), value: 5),
      DropdownMenuItem(
          child: Text("Contrat de professionnalisation"), value: 6),
      DropdownMenuItem(child: Text("Autre"), value: 7),
    ];
    String choiceProject=listItemsChoiceProject[0];

    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Profil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: width * 0.1, color: Colors.black)),
                      SizedBox(height: 50),
                      Text("Quel est votre situation familiale?"),
                      DropdownButtonFormField(
                          items: itemsProfileStep1,
                          hint: Text("Situation familiale"),
                          //value: 1,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                      SizedBox(height: 10),
                      Text("Quel est le nombre d'enfants?"),
                      DropdownButtonFormField(
                          items: itemsProfileStep2,
                          hint: Text("Nombre d'enfants"),
                          //value: 1,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nationalité',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Profession',
                        ),
                      ),
                      Text("Quel est votre contrat?"),
                      DropdownButtonFormField(
                          items: itemsProfileStep3,
                          hint: Text("Votre contrat"),
                          //value: 1,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Ville/Pays d'habitation"),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Text("Que cherchez-vous?"),
                      ToggleSwitch(
                        minWidth: 90.0,
                        initialLabelIndex: 0,
                        labels: listItemsChoiceProject,
                        activeBgColor: Colors.orangeAccent,
                        onToggle: (index) {
                          choiceProject = listItemsChoiceProject[index];
                          print('switched to: $index');
                        },
                      ),
                      MaterialButton(
                          child: Text("Confirmer"),
                          color: Colors.yellow[200],
                          onPressed: () {
                            //goRegister(context);
                            if (choiceProject == "Achat") {
                              goProjectAchat(context);
                            }
                            if (choiceProject == "Location") {
                              goProjectLocation(context);
                            }
                            if (choiceProject == "Investissement") {
                              goProjectInvestissement(context);
                            }
                          })
                    ]),
              ),
            )
            ));
  }
  void goProjectAchat(context){
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return CreateProjectAchatV2();
      }
      ));
  }
  void goProjectLocation(context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return CreateProjectLocation();
      }
      ));

  }
  void goProjectInvestissement(context){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return CreateProjectInvestissement();
      }
      ));

  }
}
