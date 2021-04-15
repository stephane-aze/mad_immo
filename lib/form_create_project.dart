

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FormCreateProject extends StatefulWidget {
  @override
  _FormCreateProjectState createState() => _FormCreateProjectState();
}

class _FormCreateProjectState extends State<FormCreateProject> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Création de projet'),
        centerTitle: true,
      ),
      body:  Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Vos intérêts'),
                    content: Column(
                      children: <Widget>[
                        Text("Que souhaitez-vous?"),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          labels: ['Location', 'Achat'],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                        Text("Quel est votre type choisi?"),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          labels: ['Maison', 'Appartement','Parking', 'Box'],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),

                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Vos connaissances'),
                    content: Column(
                      children: <Widget>[
                        Text("Avez-vous déjà rencontré un agent immobilier?"),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          labels: ['Oui','Non'],
                          icons: [Icons.check, Icons.close],
                          activeBgColors: [Colors.green, Colors.red],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                        Text("Avez-vous discuté avec votre banquier?"),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          labels: ['Oui','Non'],
                          icons: [Icons.check, Icons.close],
                          activeBgColors: [Colors.green, Colors.red],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),

                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Vos attentes'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Votre budget'),
                        ),
                        Text("Comment voyez-vous ce projet?"),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          labels: ['Long terme','Court terme'],
                          //icons: [Icons.check, Icons.close],
                          activeBgColors: [Colors.green, Colors.red],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),


                      ],
                    ),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),

    );
  }
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}
class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body:  Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Account'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email Address'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Address'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Home Address'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Postcode'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Mobile Number'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),

    );
  }
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}