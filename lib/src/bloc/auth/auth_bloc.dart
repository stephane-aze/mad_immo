import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_immo/src/services/auth_service.dart';
import 'package:mad_immo/src/utils/connection_status_internet.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  StreamSubscription subscription;

  AuthBloc(AuthService AuthService)
      : assert(AuthService != null),
        _authService = AuthService,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    } else if (event is NoConnectivityEvent) {
      yield* _mapNoConnectivityEventToState();
    }
  }

  Stream<AuthState> _mapNoConnectivityEventToState() async* {
    yield AuthLoading();
    //ConnectionStatusSingleton().checkConnection()
    /*Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
                         if(Platform.isAndroid) {
                           
                              try {
                                     final lookupResult = await InternetAddress.lookup('google.com');
                                     if (lookupResult.isNotEmpty && lookupResult.first.rawAddress.isNotEmpty) {
                                         print('connected');
                                    }
                                  } on SocketException catch (error) {
                                       yield NoConnectivity(message: error.message);
                                  }
                          } else if(result == ConnectivityResult.none ) {
                           yield NoConnectivity(message: "Noconnection");

                          }
                           print("Connected");

                    });*/
  }

  Stream<AuthState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      //final currentUser = await _authService.getCurrentUser();
      final currentUser = null;
      if (currentUser != null) {
        yield AuthAuthenticated(auth: currentUser);
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    yield AuthAuthenticated(auth: event.user);
  }

  Stream<AuthState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
    await _authService.signOut();
    yield AuthNotAuthenticated();
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
