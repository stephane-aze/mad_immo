import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mad_immo/login.dart';
import 'package:mad_immo/register.dart';
import 'home.dart';
//import on board me dependency

class IntroScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color:Colors.blueAccent
      ), //tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.black54),
      //body text size and color
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding

    );

    return IntroductionScreen(

      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "Bienvenue",
          body: "Nous souhaitons vos réussites dans vos projets.",
          image: Image.asset('assets/images/logo_mad_immo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Parlez-moi de vous?",
          body: "Nous sommes à votre écoute pour trouver ce que vous voulez",
          image: Image.asset('assets/images/conversation.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Succès rapide",
          body: "Notre équipe fera tout pour garantir votre projet.",
          image: introImage('assets/images/promotion.png'),
          decoration: pageDecoration,
        ),
        //add more screen here
      ],

      onDone: () => goLoginpage(context), //go to home page on done
      onSkip: () => goLoginpage(context), // You can override on skip
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Passer', style: TextStyle(color: Colors.black54),),
      next: Icon(Icons.arrow_forward, color: Colors.black54,),
      done: Text('Commencer', style: TextStyle(
          fontWeight: FontWeight.w600, color:Colors.black54
      ),),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.black54, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goLoginpage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return LoginPage();
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset('$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
}