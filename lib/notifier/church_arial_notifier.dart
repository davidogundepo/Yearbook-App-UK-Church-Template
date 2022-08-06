
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/ChurchArial.dart';

class ChurchArialNotifier with ChangeNotifier {
  List<ChurchArial> _churchArialList = [];
  ChurchArial _currentChurchArial;

  UnmodifiableListView<ChurchArial> get churchArialList => UnmodifiableListView(_churchArialList);

  ChurchArial get currentChurchArial => _currentChurchArial;

  set churchArialList(List<ChurchArial> churchArialList) {
    _churchArialList = churchArialList;
    notifyListeners();
  }

  set currentChurchArial(ChurchArial churchArial) {
    _currentChurchArial = churchArial;
    notifyListeners();
  }

}