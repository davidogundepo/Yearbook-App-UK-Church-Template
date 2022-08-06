import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/NoblemenNetwork.dart';
import '../notifier/noblemen_network_notifier.dart';

getNoblemenNetwork(NoblemenNetworkNotifier noblemenNetworkNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('NoblemenNetwork')
      .orderBy('name')
      .get();

  List<NoblemenNetwork> _noblemenNetworkList = [];

  snapshot.docs.forEach((document) {
    NoblemenNetwork noblemenNetwork = NoblemenNetwork.fromMap(document.data());
    _noblemenNetworkList.add(noblemenNetwork);
  });

  noblemenNetworkNotifier.noblemenNetworkList = _noblemenNetworkList;
}
