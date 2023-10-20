import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String textfield;

  NameProvider({this.textfield = 'Amar Rawat'});

  void updateText({required String newTextfield}) {
    textfield = newTextfield;
    notifyListeners();
  }
}

class IndexProvider extends ChangeNotifier {
  int currentIndex;
  IndexProvider({this.currentIndex = 0});

  void indexChanger({required int newIndex}) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
