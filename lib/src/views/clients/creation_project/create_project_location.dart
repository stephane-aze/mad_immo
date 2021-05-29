import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_immo/src/models/ProjetLocation.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateProjectLocation extends StatefulWidget {
  @override
  _CreateProjectLocationState createState() => _CreateProjectLocationState();
}

class _CreateProjectLocationState extends State<CreateProjectLocation> {
  //PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlowBuilder<ProjetLocation>(
      state: const ProjetLocation(),
      onGeneratePages: (projet, pages) {
        return [
          MaterialPage(child: TypeLocataireForm()),
          if (projet.typeLocataire != null)
            MaterialPage(child: TypeBiensForm()),
          if (projet.typeBiens != null) MaterialPage(child: SurfaceMinForm()),
          if (projet.surfaceMin != null) MaterialPage(child: BudgetMaxForm()),
          if (projet.budgetMax != null) MaterialPage(child: GarantForm()),
          if (projet.hasGarant != null) MaterialPage(child: LocalisationForm()),
          if (projet.localisation != null) MaterialPage(child: VisitForm()),
          if (projet.nbVisites != null) MaterialPage(child: Recap())
        ];
      },
    ));
  }
}

class TypeLocataireForm extends StatefulWidget {
  @override
  _TypeLocataireFormState createState() => _TypeLocataireFormState();
}

class _TypeLocataireFormState extends State<TypeLocataireForm> {
  var _typeLocataire = '';

  void _continuePressed() {
    context
        .flow<ProjetLocation>()
        .update((projet) => projet.copyWith(typeLocataire: _typeLocataire));
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
      appBar: AppBar(title: const Text('Location effectué ')),
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
              hint: Text('Choix de la location effectué'),
              //value: 1,
              onChanged: (value) => setState(() => _typeLocataire = value),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _typeLocataire.isNotEmpty ? _continuePressed : null,
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
    context
        .flow<ProjetLocation>()
        .update((projet) => projet.copyWith(typeBiens: _typeBiens));
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
    context.flow<ProjetLocation>().update((projet) =>
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

class BudgetMaxForm extends StatefulWidget {
  @override
  _BudgetMaxFormState createState() => _BudgetMaxFormState();
}

class _BudgetMaxFormState extends State<BudgetMaxForm> {
  TextEditingController budgetMaxController = new TextEditingController();
  bool activeButton = false;
  void _continuePressed() {
    context.flow<ProjetLocation>().update((projet) =>
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
              currentStep: 4,
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

class GarantForm extends StatefulWidget {
  @override
  _GarantFormState createState() => _GarantFormState();
}

class _GarantFormState extends State<GarantForm> {
  bool _hasGarant = true;
  int _initialIndex = 0;

  void _continuePressed() {
    context
        .flow<ProjetLocation>()
        .update((projet) => projet.copyWith(hasGarant: _hasGarant));
  }

  @override
  Widget build(BuildContext context) {
    List<String> itemsHasGarant = ['Oui', 'Non'];
    return Scaffold(
      appBar: AppBar(title: const Text('Les garants?')),
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
            Text("Avez-vous des garants"),
            ToggleSwitch(
              initialLabelIndex: _initialIndex,
              labels: itemsHasGarant,
              activeBgColors: [Colors.green, Colors.red],
              onToggle: (index) {
                if (itemsHasGarant[index] == 'Oui') {
                  _hasGarant = true;
                } else {
                  _hasGarant = false;
                }
                _initialIndex = index;
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _hasGarant != null ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class LocalisationForm extends StatefulWidget {
  @override
  _LocalisationFormState createState() => _LocalisationFormState();
}

class _LocalisationFormState extends State<LocalisationForm> {
  TextEditingController localisationController = new TextEditingController();
  String localisation;
  bool activeButton = false;
  void _continuePressed() {
    context.flow<ProjetLocation>().update(
        (projet) => projet.copyWith(localisation: localisationController.text));
  }

  @override
  Widget build(BuildContext context) {
    print(localisation);
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
        .flow<ProjetLocation>()
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
              hint: Text('Combien de visites effectués '),
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
    ProjetLocation projet = context.flow<ProjetLocation>().state;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StepProgressIndicator(
                totalSteps: 8,
                currentStep: 8,
                selectedColor: Colors.red,
                unselectedColor: Colors.yellow,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Récapitulatif du projet location",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(children: [
                Text("Type de locataire :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.typeLocataire),
              ]),
              Row(children: [
                Text("Type de Biens :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.typeBiens),
              ]),
              Row(children: [
                Text("Surface du biens :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.surfaceMin.toString()),
              ]),
              Row(children: [
                Text("Montant Apport :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.hasGarant ? "Oui" : "Non"),
              ]),
              Row(children: [
                Text("Budget :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.budgetMax.toString()),
              ]),
              Row(children: [
                Text("Localisation :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.localisation),
              ]),
              Row(children: [
                Text("Nombre de visites :"),
                SizedBox(
                  width: 10,
                ),
                Text(projet.nbVisites),
              ]),
              MaterialButton(
                  child: const Text('Continuer'),
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

sendProject(ProjetLocation projetLocation) {
  /*Future<http.Response> response = http.post(
      Uri.parse('https://example.com/whatsit/create'),
      body: {'name': 'hhoiho'});*/
  print(projetLocation);
}
