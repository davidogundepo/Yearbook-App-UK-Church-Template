import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/Choir.dart';


class ChoirNotifier with ChangeNotifier {
  List<Choir> _choirList = [];
  Choir _currentChoir;

  UnmodifiableListView<Choir> get choirList => UnmodifiableListView(_choirList);

  Choir get currentChoir => _currentChoir;

  set choirList(List<Choir> choirList) {
    _choirList = choirList;
    notifyListeners();
  }

  set currentChoir(Choir choir) {
    _currentChoir = choir;
    notifyListeners();
  }

}