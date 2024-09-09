
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  String _id = '100000121';
  String _storelocation = 'Bhanumart';
  String _deliverylocation = 'arera colony';

  String get id => _id;
  String get storelocation => _storelocation;
  String get deliverylocation => _deliverylocation;

  // We can add methods to update the profile information if necessary.
  void updateDetail(String id, String storelocation, String deliverylocation,) {
    _id = id;
    _storelocation = storelocation;
    _deliverylocation = deliverylocation;
    notifyListeners();
  }
}
