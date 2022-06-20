
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  ///add to list coffee
  updateUser(User? _user) {
    user = _user;
    notifyListeners();
  }

}
