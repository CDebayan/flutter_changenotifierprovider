import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier{
  int count = 0;

  void increment(){
    count++;
    notifyListeners();
  }

  void decrement(){
    count--;
    notifyListeners();
  }

}