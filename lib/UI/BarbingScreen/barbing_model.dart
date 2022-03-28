import 'package:flutter/material.dart';

class BarbingNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void incrementValue() {
    _value++;
    notifyListeners();
  }
}
