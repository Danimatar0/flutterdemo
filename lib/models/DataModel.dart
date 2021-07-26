import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutterdemo/models/models.dart';

class DataModel {
  int totalRecords;
  List<UserModel> items;
  
  DataModel({
    required this.totalRecords,
    required this.items,
  });
  

  DataModel copyWith({
    int? totalRecords,
    List<UserModel>? items,
  }) {
    return DataModel(
      totalRecords: totalRecords ?? this.totalRecords,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalRecords': totalRecords,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      totalRecords: map['totalRecords'],
      items: List<UserModel>.from(map['items']?.map((x) => UserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataModel(totalRecords: $totalRecords, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataModel &&
      other.totalRecords == totalRecords &&
      listEquals(other.items, items);
  }

  @override
  int get hashCode => totalRecords.hashCode ^ items.hashCode;
}
