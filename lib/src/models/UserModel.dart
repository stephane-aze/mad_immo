import 'package:flutter/cupertino.dart';

class Users {
  int id;
  String username;
  String nom;
  String prenom;
  String email;
  String emailPerso;
  String champ;
  String phone;
  String accessToken;
  List<String> roles;
  List<String> secteurs;
  String imageURL;

  Users(
      {@required this.nom,
      @required this.prenom,
      @required this.accessToken,
      @required this.roles});
}
