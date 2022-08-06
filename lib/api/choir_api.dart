import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Choir.dart';
import '../notifier/choir_notifier.dart';

getChoir(ChoirNotifier choirNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Choir')
      .orderBy('id')
      .get();

  List<Choir> _choirList = [];

  snapshot.docs.forEach((document) {
    Choir choir = Choir.fromMap(document.data());
    _choirList.add(choir);
  });

  choirNotifier.choirList = _choirList;
}
