import 'dart:convert';

import 'package:flutter/foundation.dart';

class ViboModel {
  List<String> images;
  String option;
  ViboModel({
    required this.images,
    required this.option,
  });

  ViboModel copyWith({
    List<String>? images,
    String? option,
  }) {
    return ViboModel(
      images: images ?? this.images,
      option: option ?? this.option,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'option': option,
    };
  }

  factory ViboModel.fromMap(Map<String, dynamic> map) {
    return ViboModel(
      images: List<String>.from(map['images']),
      option: map['option'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ViboModel.fromJson(String source) =>
      ViboModel.fromMap(json.decode(source));

  @override
  String toString() => 'ViboModel(images: $images, option: $option)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ViboModel &&
        listEquals(other.images, images) &&
        other.option == option;
  }

  @override
  int get hashCode => images.hashCode ^ option.hashCode;
}
