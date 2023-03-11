import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TGFUserFirebaseUser {
  TGFUserFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TGFUserFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TGFUserFirebaseUser> tGFUserFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TGFUserFirebaseUser>(
      (user) {
        currentUser = TGFUserFirebaseUser(user);
        return currentUser!;
      },
    );
