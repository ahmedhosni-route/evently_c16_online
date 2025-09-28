import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c16_online/modules/layout/services/event_model.dart';

class LayoutServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> getCollectionRef(){
    return firestore.collection("events").withConverter(fromFirestore: (snapshot, options) {
      return EventModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    },);
  }

  static EventModel model =
      EventModel(title: "title", image: "image", date: "date", desc: "desc");

  static addData() async {
    var ref = getCollectionRef();
    ref.doc().set(model);
  }

  static getData() async {
    var ref = getCollectionRef();
    var data = await ref.get();
    data.docs;
  }
}
