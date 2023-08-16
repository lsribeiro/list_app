import '../../src.dart';

class ListEntityMapper {
  static Map<String, dynamic> toJson(ListEntity entity) {
    try {
      return {
        'id': entity.id,
        'items': entity.items.map((e) => ItemEntityMapper.toJson(e)).toList(),
        'createdAt': entity.createdAt.millisecondsSinceEpoch,
      };
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }

  static ListEntity fromJson(Map<String, dynamic> map) {
    final itemsMap = map['items'] as List<Map<String, dynamic>>;
    final items = itemsMap.map<ItemEntity>((e) => ItemEntityMapper.fromJson(e)).toList();

    try {
      return ListEntity(
        id: map['id'] as String,
        items: items,
        createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      );
    } catch (e) {
      throw Exception('JsonParsingException: $e');
    }
  }
}
