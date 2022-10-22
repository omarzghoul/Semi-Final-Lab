import 'package:citycafe_app/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore instance = FirebaseFirestore.instance;

create(name, userId, cours) {
  instance.collection("Users").add({
    'name': name,
    'id': userId,
    'cours': cours,
  });
}

delete(id) {
  instance.collection("Users").doc(id).delete();
}

update(id, name, userId, cours) {
  instance.collection("Users").doc(id).update({
    'name': name,
    'id': userId,
    'cours': cours,
  });
}

Stream<QuerySnapshot> getStream() async* {
  yield* FirebaseFirestore.instance.collection("Users").snapshots();
}
