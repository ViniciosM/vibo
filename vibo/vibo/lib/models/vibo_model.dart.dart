import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ViboModel {
  List<String> images = [];
  ViboModel({
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'images': images,
    };
  }

  ViboModel.fromDocument(DocumentSnapshot snapshot) {
    images = snapshot.get('images') ?? [];
  }
}
