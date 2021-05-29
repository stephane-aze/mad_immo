import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_immo/src/models/ProjetInvestissement.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class CreateProjectInvestissement extends StatefulWidget {
  @override
  _CreateProjectInvestissementState createState() =>
      _CreateProjectInvestissementState();
}

class _CreateProjectInvestissementState
    extends State<CreateProjectInvestissement> {
  //PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlowBuilder<ProjetInvestissement>(
      state: const ProjetInvestissement(),
      onGeneratePages: (projet, pages) {
        return [
          MaterialPage(child: TypeInvestisseurForm()),
          if (projet.typeInvestisseur != null)
            MaterialPage(child: TypeBiensForm()),
          if (projet.typeBiens != null) MaterialPage(child: SurfaceMinForm()),
          if (projet.surfaceMin != null)
            MaterialPage(child: MontantApportForm()),
          if (projet.montantApport != null)
            MaterialPage(child: BudgetMaxForm()),
          if (projet.budgetMax != null) MaterialPage(child: LocalisationForm()),
          if (projet.localisation != null) MaterialPage(child: VisitForm()),
          if (projet.nbVisites != null) MaterialPage(child: Recap()),
          
        ];
      },
    ));
  }
}

class TypeInvestisseurForm extends StatefulWidget {
  @override
  _TypeInvestisseurFormState createState() => _TypeInvestisseurFormState();
}

class _TypeInvestisseurFormState extends State<TypeInvestisseurForm> {
  var _typeInvestisseur = '';

  void _continuePressed() {
    context.flow<ProjetInvestissement>().update((projetInvestissement) =>
        projetInvestissement.copyWith(typeInvestisseur: _typeInvestisseur));
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> itemsProfileStep1 = [
      DropdownMenuItem(child: Text("•	Seul(e)"), value: "Seul(e)"),
      DropdownMenuItem(child: Text("•	En couple"), value: "En couple"),
      DropdownMenuItem(child: Text("•	En groupe"), value: "En groupe"),
      DropdownMenuItem(child: Text("•	Autre"), value: "Autre"),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Investissement effectué ')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 1,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            DropdownButtonFormField(
              items: itemsProfileStep1,
              hint: Text('Choix des investissements effectués'),
              //value: 1,
              onChanged: (value) => setState(() => _typeInvestisseur = value),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _typeInvestisseur.isNotEmpty ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class TypeBiensForm extends StatefulWidget {
  @override
  _TypeBiensFormState createState() => _TypeBiensFormState();
}

class _TypeBiensFormState extends State<TypeBiensForm> {
  String _typeBiens;

  void _continuePressed() {
    context.flow<ProjetInvestissement>().update((projetInvestissement) =>
        projetInvestissement.copyWith(typeBiens: _typeBiens));
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> itemsProfileStep1 = [
      DropdownMenuItem(child: Text("•	Appartement"), value: "Appartement"),
      DropdownMenuItem(child: Text("•	Maison"), value: "Maison"),
      DropdownMenuItem(child: Text("•	Terrain"), value: "Terrain"),
      DropdownMenuItem(child: Text("•	Parking/box"), value: "Parking/box"),
      DropdownMenuItem(child: Text("•	Loft/Atelier"), value: "Loft/Atelier"),
      DropdownMenuItem(child: Text("•	Château"), value: "Château"),
      DropdownMenuItem(child: Text("•	Bâtiment"), value: "Bâtiment"),
      DropdownMenuItem(child: Text("•	Immeuble"), value: "Immeuble"),
      DropdownMenuItem(child: Text("•	Péniche"), value: "Péniche"),
      DropdownMenuItem(child: Text("•	Bureaux"), value: "Bureaux"),
      DropdownMenuItem(
          child: Text("•	Fonds de commerce"), value: "Fonds de commerce"),
      DropdownMenuItem(child: Text("•	Autres "), value: "Autres"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Type de bien')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 2,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            DropdownButtonFormField(
              items: itemsProfileStep1,
              hint: Text('Quel est le type de bien recherché '),
              //value: 1,
              onChanged: (value) => setState(() => _typeBiens = value),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _typeBiens != null ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class SurfaceMinForm extends StatefulWidget {
  @override
  _SurfaceMinFormState createState() => _SurfaceMinFormState();
}

class _SurfaceMinFormState extends State<SurfaceMinForm> {
  TextEditingController surfaceMinController = new TextEditingController();
  bool activeButton = false;

  void _continuePressed() {
    context.flow<ProjetInvestissement>().update((projet) =>
        projet.copyWith(surfaceMin: double.parse(surfaceMinController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La surface min souhaitée')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 3,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            TextFormField(
              controller: surfaceMinController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                hintText: "Surface Min",
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty || value.trim() != "") {
                    activeButton = true;
                  } else {
                    activeButton = false;
                  } /**/
                });
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: activeButton ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class MontantApportForm extends StatefulWidget {
  @override
  _MontantApportFormState createState() => _MontantApportFormState();
}

class _MontantApportFormState extends State<MontantApportForm> {
  TextEditingController montantApportController = new TextEditingController();
  bool activeButton = false;
  void _continuePressed() {
    context.flow<ProjetInvestissement>().update((projet) => projet.copyWith(
        montantApport: int.parse(montantApportController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La surface min souhaitée')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 4,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            TextFormField(
              controller: montantApportController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                hintText: "Surface Min",
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty || value.trim() != "") {
                    activeButton = true;
                  } else {
                    activeButton = false;
                  } /**/
                });
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: activeButton ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class BudgetMaxForm extends StatefulWidget {
  @override
  _BudgetMaxFormState createState() => _BudgetMaxFormState();
}

class _BudgetMaxFormState extends State<BudgetMaxForm> {
  TextEditingController budgetMaxController = new TextEditingController();
  bool activeButton = false;

  void _continuePressed() {
    context.flow<ProjetInvestissement>().update((projet) =>
        projet.copyWith(budgetMax: double.parse(budgetMaxController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quel est votre budget maximum')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 5,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            TextFormField(
              controller: budgetMaxController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                hintText: "Votre budget Maximum",
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty || value.trim() != "") {
                    activeButton = true;
                  } else {
                    activeButton = false;
                  } /**/
                });
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: activeButton ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

//
class LocalisationForm extends StatefulWidget {
  @override
  _LocalisationFormState createState() => _LocalisationFormState();
}

class _LocalisationFormState extends State<LocalisationForm> {
  TextEditingController localisationController = new TextEditingController();
  bool activeButton = false;

  void _continuePressed() {
    print(localisationController.text);
    context.flow<ProjetInvestissement>().update(
        (projet) => projet.copyWith(localisation: localisationController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Secteur géographique du bien recherché ')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 6,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            TextFormField(
              controller: localisationController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                hintText: "Quel est le lieu souhaité",
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty || value.trim() != "") {
                    activeButton = true;
                  } else {
                    activeButton = false;
                  } /**/
                });
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: activeButton ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class VisitForm extends StatefulWidget {
  @override
  _VisitFormState createState() => _VisitFormState();
}

class _VisitFormState extends State<VisitForm> {
  String _nbVisites;
  void _continuePressed() {
    context
        .flow<ProjetInvestissement>()
        .update((projet) => projet.copyWith(nbVisites: _nbVisites));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nombre de visites')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 8,
              currentStep: 7,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            DropdownButtonFormField(
              items: ['Entre 1 et 5', 'Entre 5 et 10', 'Plus de 10', 'Aucune']
                  .map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              hint: Text('Combien de visites effectués'),
              //value: 1,
              onChanged: (value) => setState(() => _nbVisites = value),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _nbVisites != null ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}
class Recap extends StatefulWidget {
  @override
  _RecapState createState() => _RecapState();
}

class _RecapState extends State<Recap> {
  @override
  Widget build(BuildContext context) {
    ProjetInvestissement projet = context.flow<ProjetInvestissement>().state;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Récapitulatif du projet investissement",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                children:[
                  Text("Type d'investisseur :"),
                  SizedBox(width: 10,),
                  Text(projet.typeInvestisseur),
                  ]
              ),
              Row(
                children:[
                  Text("Type de Biens :"),
                  SizedBox(width: 10,),
                  Text(projet.typeBiens),
                  ]
              ),
              Row(
                children:[
                  Text("Surface du biens :"),
                  SizedBox(width: 10,),
                  Text(projet.surfaceMin.toString()),
                  ]
              ),
              Row(
                children:[
                  Text("Montant Apport :"),
                  SizedBox(width: 10,),
                  Text(projet.montantApport.toString()),
                  ]
              ),
              Row(
                children:[
                  Text("Budget :"),
                  SizedBox(width: 10,),
                  Text(projet.budgetMax.toString()),
                  ]
              ),
              Row(
                children:[
                  Text("Localisation :"),
                  SizedBox(width: 10,),
                  Text(projet.localisation),
                  ]
              ),
              Row(
                children:[
                  Text("Nombre de visites :"),
                  SizedBox(width: 10,),
                  Text(projet.nbVisites),
                  ]
              ),
              MaterialButton(
                child: const Text('Confirmer'),
                color: Colors.yellow,
                onPressed: () {
                    sendProject(projet);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

sendProject(ProjetInvestissement projet) {
  print(projet);
}

