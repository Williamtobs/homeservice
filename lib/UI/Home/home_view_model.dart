import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier{
  final String _welcome = "Hi, John";
  final String _help = "Do you need some help today?";

  String get welcome => _welcome;
  String get help => _help;



}