
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/NoblemenNetwork.dart';

class NoblemenNetworkNotifier with ChangeNotifier {
  List<NoblemenNetwork> _noblemenNetworkList = [];
  NoblemenNetwork _currentNoblemenNetwork;

  UnmodifiableListView<NoblemenNetwork> get noblemenNetworkList => UnmodifiableListView(_noblemenNetworkList);

  NoblemenNetwork get currentNoblemenNetwork => _currentNoblemenNetwork;

  set noblemenNetworkList(List<NoblemenNetwork> noblemenNetworkList) {
    _noblemenNetworkList = noblemenNetworkList;
    notifyListeners();
  }

  set currentNoblemenNetwork(NoblemenNetwork noblemenNetwork) {
    _currentNoblemenNetwork = noblemenNetwork;
    notifyListeners();
  }

}