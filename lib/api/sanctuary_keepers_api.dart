import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SanctuaryKeepers.dart';
import '../notifier/sanctuary_keepers_notifier.dart';

getSanctuaryKeepers(SanctuaryKeepersNotifier sanctuaryKeepersNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('SanctuaryUnit')
      .orderBy('name')
      .get();

  List<SanctuaryKeepers> _sanctuaryKeepersList = [];

  snapshot.docs.forEach((document) {
    SanctuaryKeepers sanctuaryKeepers = SanctuaryKeepers.fromMap(document.data());
    _sanctuaryKeepersList.add(sanctuaryKeepers);
  });

  sanctuaryKeepersNotifier.sanctuaryKeepersList = _sanctuaryKeepersList;
}
