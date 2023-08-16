import '../../src.dart';

class ListEntity {
  const ListEntity({
    required this.id,
    required this.items,
    required this.createdAt,
  });

  final String id;
  final List<ItemEntity> items;
  final DateTime createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          items == other.items &&
          createdAt == other.createdAt);

  @override
  int get hashCode => id.hashCode ^ items.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'ListEntity{ id: $id, items: $items, createdAt: $createdAt,}';
  }

  ListEntity copyWith({
    String? id,
    List<ItemEntity>? items,
    DateTime? createdAt,
  }) {
    return ListEntity(
      id: id ?? this.id,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
