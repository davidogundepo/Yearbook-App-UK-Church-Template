import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/MediaUnit.dart';


class MediaUnitNotifier with ChangeNotifier {
  List<MediaUnit> _mediaUnitList = [];
  MediaUnit _currentMediaUnit;

  UnmodifiableListView<MediaUnit> get mediaUnitList => UnmodifiableListView(_mediaUnitList);

  MediaUnit get currentMediaUnit => _currentMediaUnit;

  set mediaUnitList(List<MediaUnit> mediaUnitList) {
    _mediaUnitList = mediaUnitList;
    notifyListeners();
  }

  set currentMediaUnit(MediaUnit mediaUnit) {
    _currentMediaUnit = mediaUnit;
    notifyListeners();
  }

}