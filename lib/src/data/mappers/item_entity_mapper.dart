import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_app/src/src.dart';

class ItemEntityMapper {
  static Map<String, dynamic> toJson(ItemEntity entity) {
    try {
      return {
        'id': entity.id,
        'listId': entity.listId,
        'title': entity.title,
        'description': entity.description,
        'createdAt': entity.createdAt.millisecondsSinceEpoch,
        'updatedAt': entity.updatedAt.millisecondsSinceEpoch,
      };
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }

  static fromJson(Map<String, dynamic> map) {
    try {
      return ItemEntity(
        id: map['id'] as String,
        listId: map['listId'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        updatedAt: (map['updatedAt'] as Timestamp).toDate(),
      );
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }
}
