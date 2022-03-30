import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibo/models/vibo_model.dart.dart';

/*
class ViboRepository {
  final firebase = FirebaseFirestore.instance.collection('vibo');

  Future<ViboModel> getImages(String docId) async {
    ViboModel viboNoImages = ViboModel(images: ['', '']);
    ViboModel viboImg;
    try {
      await firebase.doc(docId).get().then(((DocumentSnapshot docSnap) {
        if (docSnap.exists) {
          viboImg = ViboModel.fromDocument(docSnap);
          if(viboImg != null){
            return viboImg;
          }
          
        }else{
          return viboNoImages;
        }
      }));
    } catch (e) {
      throw Exception(e);
    }
  }
}
*/