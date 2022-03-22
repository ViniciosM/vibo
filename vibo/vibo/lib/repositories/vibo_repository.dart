import 'package:cloud_firestore/cloud_firestore.dart';

class ViboRepository {
  var firebase = FirebaseFirestore.instance;

  Future<List<String>> getImages(String option) async {
    final List<String> images = [];

    try {
      DocumentSnapshot response = await firebase.collection('vibo').doc(option).get();
    
    if(response.exists){
      var x = response.data.;
    }else{
      return images;
    }
    } catch(e){
      
    }
    
    response.data().
  }
}
