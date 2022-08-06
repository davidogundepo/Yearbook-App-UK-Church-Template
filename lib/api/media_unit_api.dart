import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/MediaUnit.dart';
import '../notifier/media_unit_notifier.dart';

getMediaUnit(MediaUnitNotifier mediaUnitNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('MediaUnit')
      .orderBy('name')
      .get();

  List<MediaUnit> _mediaUnitList = [];

  snapshot.docs.forEach((document) {
    MediaUnit mediaUnit = MediaUnit.fromMap(document.data());
    _mediaUnitList.add(mediaUnit);
  });

  mediaUnitNotifier.mediaUnitList = _mediaUnitList;
}
