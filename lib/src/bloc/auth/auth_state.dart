import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mad_immo/src/models/Authentification.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthNotAuthenticated extends AuthState {}
class NoConnectivity extends AuthState{
  final String message;

  NoConnectivity({ this.message });

}
class AuthAuthenticated extends AuthState {
  final Authentification auth;

  AuthAuthenticated({@required this.auth});

  @override
  List<Object> get props => [auth];
}

class AuthenticationFailure extends AuthState {
  final String message;

  AuthenticationFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
