import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vibo/models/vibo_model.dart.dart';

class ViboRepository {

  final firebase = FirebaseFirestore.instance.collection('vibo');

  Future<List<String>> getImages(String docId) async {
    List<String> urlImages = [];
    var snapshot = await firebase.doc(docId).get().then(((DocumentSnapshot docSnap){
      if(docSnap.exists){
        urlImages = ViboModel.fromDocument(docSnap);
      }
    }));

    
  }

}
