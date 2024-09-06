import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String _name = 'Micheal Sam';
  String _phone = '+91 9524888800';
  String _email = 'michealsam152480@gmail.com';

  String get name => _name;
  String get phone => _phone;
  String get email => _email;

  // We can add methods to update the profile information if necessary.
  void updateProfile(String name, String phone, String email) {
    _name = name;
    _phone = phone;
    _email = email;
    notifyListeners();
  }
}
