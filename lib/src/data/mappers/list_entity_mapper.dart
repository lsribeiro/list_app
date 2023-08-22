import 'package:cloud_firestore/cloud_firestore.dart';

import '../../src.dart';

class ListEntityMapper {
  static Map<String, dynamic> toJson(ListEntity entity) {
    try {
      return {
        'id': entity.id,
        'name': entity.name,
        'ownerId': entity.ownerId,
        'items': entity.items.map((e) => ItemEntityMapper.toJson(e)).toList(),
        'createdAt': Timestamp.fromDate(entity.createdAt),
      };
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }

  static ListEntity fromJson(Map<String, dynamic> map) {
    final itemsMap = map['items'] != null ? map['items'] as List<Map<String, dynamic>> : null;
    final items =
        itemsMap != null ? itemsMap.map<ItemEntity>((e) => ItemEntityMapper.fromJson(e)).toList() : <ItemEntity>[];

    try {
      return ListEntity(
        id: map['id'] as String,
        name: map['name'] as String,
        ownerId: map['ownerId'] as String,
        items: items,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
      );
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }
}
