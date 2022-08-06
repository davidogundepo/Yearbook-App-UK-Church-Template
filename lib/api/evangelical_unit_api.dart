import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/EvangelicalUnit.dart';
import '../notifier/evangelical_unit_notifier.dart';

getEvangelicalUnit(EvangelicalUnitNotifier evangelicalUnitNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('EvangelicalUnit')
      .orderBy('name')
      .get();

  List<EvangelicalUnit> _evangelicalUnitList = [];

  snapshot.docs.forEach((document) {
    EvangelicalUnit evangelicalUnit = EvangelicalUnit.fromMap(document.data());
    _evangelicalUnitList.add(evangelicalUnit);
  });

  evangelicalUnitNotifier.evangelicalUnitList = _evangelicalUnitList;
}
