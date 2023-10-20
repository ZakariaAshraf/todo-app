
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/modal/task_modal.dart';

class FirestoreUtils {
 static CollectionReference<TaskModal> getCollection() {
    return FirebaseFirestore.instance
        .collection("TasksCollection")
        .withConverter<TaskModal>(
        fromFirestore: (snapshot, _) =>TaskModal.fromFirestore(snapshot.data()!) ,
        toFirestore: (value, _) =>value.toFirstore(),
    );
  }

  static Future<void>addDataToFirestore(TaskModal modal) {
    var collectionRef = getCollection();
    var docRef=collectionRef.doc();
    modal.id=docRef.id;
    return docRef.set(modal);
  }

 static Future<void>deletDataFromFirestore(TaskModal modal) {
    var collectionRef=getCollection();
   return collectionRef.doc(modal.id).delete();
  }

  static Future<List<TaskModal>> getDataFromFirestore() async {
   var snapshot=await getCollection().get();
   return snapshot.docs.map((element) =>element.data()).toList();
  }
}
