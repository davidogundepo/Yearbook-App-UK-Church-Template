
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/EvangelicalUnit.dart';

class EvangelicalUnitNotifier with ChangeNotifier {
  List<EvangelicalUnit> _evangelicalUnitList = [];
  EvangelicalUnit _currentEvangelicalUnit;

  UnmodifiableListView<EvangelicalUnit> get evangelicalUnitList => UnmodifiableListView(_evangelicalUnitList);

  EvangelicalUnit get currentEvangelicalUnit => _currentEvangelicalUnit;

  set evangelicalUnitList(List<EvangelicalUnit> evangelicalUnitList) {
    _evangelicalUnitList = evangelicalUnitList;
    notifyListeners();
  }

  set currentEvangelicalUnit(EvangelicalUnit evangelicalUnit) {
    _currentEvangelicalUnit = evangelicalUnit;
    notifyListeners();
  }

}