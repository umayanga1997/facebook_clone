import 'package:flutter/material.dart';

class ScrollSize extends ChangeNotifier {
  double _scrollsize = 0;

  void changescrollsize(double size) {
    _scrollsize = size;
    notifyListeners();
  }

  double get scrollsize => _scrollsize;
}
