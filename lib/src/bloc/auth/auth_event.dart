import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:mad_immo/src/models/Authentification.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}
class NoConnectivityEvent extends AuthEvent{}
class AppLoaded extends AuthEvent {}

class UserLoggedIn extends AuthEvent {
  final Authentification user;
  UserLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];

}
class UserLoggedOut extends AuthEvent {}
