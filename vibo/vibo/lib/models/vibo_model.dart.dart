import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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

  ViboModel copyWith({
    List<String>? images,
  }) {
    return ViboModel(
      images: images ?? this.images,
    );
  }

  factory ViboModel.fromMap(Map<String, dynamic> map) {
    return ViboModel(
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ViboModel.fromJson(String source) => ViboModel.fromMap(json.decode(source));

  @override
  String toString() => 'ViboModel(images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ViboModel &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => images.hashCode;
}
