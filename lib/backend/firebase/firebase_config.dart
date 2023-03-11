import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDe0GO7yAYcg3TsYgtxvvs5_2CJJMJ6Cbc",
            authDomain: "tour-guide-finder-a2764.firebaseapp.com",
            projectId: "tour-guide-finder-a2764",
            storageBucket: "tour-guide-finder-a2764.appspot.com",
            messagingSenderId: "725984261804",
            appId: "1:725984261804:web:684b8da10d58abea88d109"));
  } else {
    await Firebase.initializeApp();
  }
}
