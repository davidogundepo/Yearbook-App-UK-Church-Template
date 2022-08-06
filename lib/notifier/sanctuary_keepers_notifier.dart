import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/SanctuaryKeepers.dart';


class SanctuaryKeepersNotifier with ChangeNotifier {
  List<SanctuaryKeepers> _sanctuaryKeepersList = [];
  SanctuaryKeepers _currentSanctuaryKeepers;

  UnmodifiableListView<SanctuaryKeepers> get sanctuaryKeepersList => UnmodifiableListView(_sanctuaryKeepersList);

  SanctuaryKeepers get currentSanctuaryKeepers => _currentSanctuaryKeepers;

  set sanctuaryKeepersList(List<SanctuaryKeepers> sanctuaryKeepersList) {
    _sanctuaryKeepersList = sanctuaryKeepersList;
    notifyListeners();
  }

  set currentSanctuaryKeepers(SanctuaryKeepers sanctuaryKeepers) {
    _currentSanctuaryKeepers = sanctuaryKeepers;
    notifyListeners();
  }

}