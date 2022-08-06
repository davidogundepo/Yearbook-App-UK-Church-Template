
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/Pastors.dart';

class PastorsNotifier with ChangeNotifier {
  List<Pastors> _pastorsList = [];
  Pastors _currentPastors;

  UnmodifiableListView<Pastors> get pastorsList => UnmodifiableListView(_pastorsList);

  Pastors get currentPastors => _currentPastors;

  set pastorsList(List<Pastors> pastorsList) {
    _pastorsList = pastorsList;
    notifyListeners();
  }

  set currentPastors(Pastors pastors) {
    _currentPastors = pastors;
    notifyListeners();
  }

}