
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ChurchArial.dart';
import '../notifier/church_arial_notifier.dart';

getChurchArial(ChurchArialNotifier churchArialNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ChurchArial').get();

  List<ChurchArial> _churchArialList = [];

  snapshot.docs.forEach((document) {
    ChurchArial churchArial = ChurchArial.fromMap(document.data());
    _churchArialList.add(churchArial);
  });

  churchArialNotifier.churchArialList = _churchArialList;
}