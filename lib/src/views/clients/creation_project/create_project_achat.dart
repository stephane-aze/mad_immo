import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../models/ProjetAchat.dart';

class CreateProjectAchatV2 extends StatefulWidget {
  @override
  _CreateProjectAchatV2State createState() => _CreateProjectAchatV2State();
}

class _CreateProjectAchatV2State extends State<CreateProjectAchatV2> {
  //PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlowBuilder<ProjetAchat>(
      state: const ProjetAchat(),
      onGeneratePages: (projetAchat, pages) {
        return [
          MaterialPage(child: TypeAcquereurForm()),
          if (projetAchat.typeAcquereur != null)
            MaterialPage(child: TypePersonnesInclusForm()),
          if (projetAchat.typePersonnesInclus != null)
            MaterialPage(child: NbAchatsForm()),
          if (projetAchat.nbAchats != null)
            MaterialPage(child: TypeBiensForm()),
          if (projetAchat.typeBiens != null)
            MaterialPage(child: SurfaceMinForm()),
          if (projetAchat.surfaceMin != null)
            MaterialPage(child: MontantApportForm()),
          if (projetAchat.montantApport != null)
            MaterialPage(child: BudgetMaxForm()),
          if (projetAchat.budgetMax != null)
            MaterialPage(child: PriseEnContactForm()),
          if (projetAchat.priseDeContact != null)
            MaterialPage(child: ConnaissanceNotaireForm()),
          if (projetAchat.connaissanceNotaire != null)
            MaterialPage(child: LocalisationForm()),
          if (projetAchat.localisation != null)
            MaterialPage(child: VisitForm()),
          if (projetAchat.nbVisites != null) MaterialPage(child: Recap()),
        ];
      },
    ));
  }
}

class TypeAcquereurForm extends StatefulWidget {
  @override
  _TypeAcquereurFormState createState() => _TypeAcquereurFormState();
}

class _TypeAcquereurFormState extends State<TypeAcquereurForm> {
  var _typeAcquereur = '';

  void _continuePressed() {
    context.flow<ProjetAchat>().update(
        (projetAchat) => projetAchat.copyWith(typeAcquereur: _typeAcquereur));
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> itemsProfileStep1 = [
      DropdownMenuItem(
          child: Text("•	Acquéreur pour habitation principale"),
          value: "Acquéreur pour habitation principale"),
      DropdownMenuItem(
          child: Text("•	Acquéreur pour habitation secondaire"),
          value: "Acquéreur pour habitation secondaire"),
      DropdownMenuItem(
          child: Text("•	Acquéreur pour des bureaux"),
          value: "Acquéreur pour des bureaux"),
      DropdownMenuItem(
          child: Text("•	Acquéreur pour un Parking"),
          value: "Acquéreur pour un Parking"),
      DropdownMenuItem(child: Text("•	Autre"), value: "Autre"),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Votre profil d\'acquéreur')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 12,
              currentStep: 1,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            DropdownButtonFormField(
              items: itemsProfileStep1,
              hint: Text('Quel est votre profil d\'acquéreur'),
              //value: 1,
              onChanged: (value) => setState(() => _typeAcquereur = value),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _typeAcquereur.isNotEmpty ? _continuePressed : null,
            )
          ],
        ),
      )),
    );
  }
}

class TypePersonnesInclusForm extends StatefulWidget {
  @override
  _TypePersonnesInclusFormState createState() =>
      _TypePersonnesInclusFormState();
}

class _TypePersonnesInclusFormState extends State<TypePersonnesInclusForm> {
  String _typePersonnesInclus;

  void _continuePressed() {
    context.flow<ProjetAchat>().update((projetAchat) =>
        projetAchat.copyWith(typePersonnesInclus: _typePersonnesInclus));
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
      appBar: AppBar(title: const Text('Achat effectué ')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StepProgressIndicator(
                totalSteps: 12,
                currentStep: 2,
                selectedColor: Colors.red,
                unselectedColor: Colors.yellow,
              ),
              SizedBox(
                height: 200,
              ),
              DropdownButtonFormField(
                items: itemsProfileStep1,
                hint: Text('Les personnes impliquées dans le projet'),
                //value: 1,
                onChanged: (value) =>
                    setState(() => _typePersonnesInclus = value),
              ),
              MaterialButton(
                child: const Text('Continuer'),
                color: Colors.yellow,
                onPressed:
                    _typePersonnesInclus != null ? _continuePressed : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NbAchatsForm extends StatefulWidget {
  @override
  _NbAchatsFormState createState() => _NbAchatsFormState();
}

class _NbAchatsFormState extends State<NbAchatsForm> {
  int _nbAchats;

  void _continuePressed() {
    context
        .flow<ProjetAchat>()
        .update((projetAchat) => projetAchat.copyWith(nbAchats: _nbAchats));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Il s\'agit pour vous')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 12,
              currentStep: 3,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            DropdownButtonFormField(
              items: ["1", "2", "3"].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              hint: Text('Combien d\'achat effectué '),
              //value: 1,
              onChanged: (value) =>
                  setState(() => _nbAchats = int.parse(value)),
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _nbAchats != null ? _continuePressed : null,
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
        .flow<ProjetAchat>()
        .update((projetAchat) => projetAchat.copyWith(typeBiens: _typeBiens));
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
              totalSteps: 12,
              currentStep: 4,
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
    context.flow<ProjetAchat>().update((projet) =>
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
              totalSteps: 12,
              currentStep: 5,
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
    context.flow<ProjetAchat>().update((projet) => projet.copyWith(
        montantApport: int.parse(montantApportController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Le montant d\'apport')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 12,
              currentStep: 6,
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
                hintText: "Le montant d\'apport",
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
    context.flow<ProjetAchat>().update((projet) =>
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
              totalSteps: 12,
              currentStep: 7,
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

class PriseEnContactForm extends StatefulWidget {
  @override
  _PriseEnContactFormState createState() => _PriseEnContactFormState();
}

class _PriseEnContactFormState extends State<PriseEnContactForm> {
  bool _priseDeContact = true;
  int _initialIndex = 0;

  void _continuePressed() {
    context
        .flow<ProjetAchat>()
        .update((projet) => projet.copyWith(priseDeContact: _priseDeContact));
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Oui', 'Non'];

    return Scaffold(
      appBar: AppBar(title: const Text('Banquier ou courtier?')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 12,
              currentStep: 8,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            Text("Avez-vous déjà pris contact avec un courtier ou une banque "),
            ToggleSwitch(
              initialLabelIndex: _initialIndex,
              labels: items,
              activeBgColors: [Colors.green, Colors.red],
              onToggle: (index) {
                if (items[index] == 'Oui') {
                  _priseDeContact = true;
                } else {
                  _priseDeContact = false;
                }
                _initialIndex = index;
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _continuePressed,
            )
          ],
        ),
      )),
    );
  }
}

class ConnaissanceNotaireForm extends StatefulWidget {
  @override
  _ConnaissanceNotaireFormState createState() =>
      _ConnaissanceNotaireFormState();
}

class _ConnaissanceNotaireFormState extends State<ConnaissanceNotaireForm> {
  bool _hasConnaissanceNotaire = true;
  int _initialIndex = 0;

  void _continuePressed() {
    context.flow<ProjetAchat>().update((projet) =>
        projet.copyWith(connaissanceNotaire: _hasConnaissanceNotaire));
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Oui', 'Non'];

    return Scaffold(
      appBar: AppBar(title: const Text('Notaire')),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepProgressIndicator(
              totalSteps: 12,
              currentStep: 9,
              selectedColor: Colors.red,
              unselectedColor: Colors.yellow,
            ),
            SizedBox(
              height: 200,
            ),
            Text("Connaissez-vous un notaire"),
            ToggleSwitch(
              initialLabelIndex: _initialIndex,
              labels: items,
              activeBgColors: [Colors.green, Colors.red],
              onToggle: (index) {
                _hasConnaissanceNotaire = items[index] == 'Oui';
                if (items[index] == 'Oui') {
                  _hasConnaissanceNotaire = true;
                } else {
                  _hasConnaissanceNotaire = false;
                }
                _initialIndex = index;
              },
            ),
            MaterialButton(
              child: const Text('Continuer'),
              color: Colors.yellow,
              onPressed: _continuePressed,
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
    context.flow<ProjetAchat>().update(
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
              totalSteps: 12,
              currentStep: 10,
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
    context.flow<ProjetAchat>().update((projet) => projet.copyWith(nbVisites: _nbVisites));
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
              totalSteps: 12,
              currentStep: 11,
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
    ProjetAchat projet = context.flow<ProjetAchat>().state;

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
                  "Récapitulatif du projet achat",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                children:[
                  Text("Type de Acquéreur"),
                  SizedBox(width: 10,),
                  Text(projet.typeAcquereur),
                  ]
              ),
              Row(
                children:[
                  Text("Les personnes impliquées :"),
                  SizedBox(width: 10,),
                  Text(projet.typePersonnesInclus),
                  ]
              ),
              Row(
                children:[
                  Text("Nombre d'achats :"),
                  SizedBox(width: 10,),
                  Text(projet.nbAchats.toString()),
                  ]
              ),
              Row(
                children:[
                  Text("Type de biens :"),
                  SizedBox(width: 10,),
                  Text(projet.typeBiens),
                  ]
              ),
              Row(
                children:[
                  Text("Surface :"),
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
                  Text("Prise en contact :"),
                  SizedBox(width: 10,),
                  Text(projet.priseDeContact? "Oui": "Non"),
                  ]
              ),
              Row(
                children:[
                  Text("A vu un notaire? :"),
                  SizedBox(width: 10,),
                  Text(projet.connaissanceNotaire? "Oui": "Non"),
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

sendProject(ProjetAchat projetAchat) {
  print(projetAchat);
}
