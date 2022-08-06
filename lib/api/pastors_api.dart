import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Pastors.dart';
import '../notifier/pastors_notifier.dart';

getPastors(PastorsNotifier pastorsNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Pastors')
      .orderBy('name')
      .get();

  List<Pastors> _pastorsList = [];

  snapshot.docs.forEach((document) {
    Pastors pastors = Pastors.fromMap(document.data());
    _pastorsList.add(pastors);
  });

  pastorsNotifier.pastorsList = _pastorsList;
}
