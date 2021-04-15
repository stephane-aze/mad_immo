import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Profil", icon: Icons.person),
  NavigationModel(title: "Projets", icon: Icons.folder),
];