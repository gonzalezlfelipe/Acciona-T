import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AccionaTFirebaseUser {
  AccionaTFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AccionaTFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AccionaTFirebaseUser> accionaTFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AccionaTFirebaseUser>(
            (user) => currentUser = AccionaTFirebaseUser(user));
