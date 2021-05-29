import 'package:mad_immo/src/models/Authentification.dart';


abstract class AuthService {
  Future<Authentification> getCurrentAuthentification();
  Future<Authentification> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthService {
  @override
  Future<Authentification> getCurrentAuthentification() async {
    return null; // return null for now
  }

  @override
  Future<Authentification> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      throw Exception('Wrong Authentificationname or password');
    }
    return Authentification( email: email, password: '');
  }

  @override
  Future<void> signOut() {
    return null;
  }
}