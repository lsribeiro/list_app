import '../../src.dart';

class ListEntity {
  const ListEntity({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.items,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String ownerId;
  final List<ItemEntity> items;
  final DateTime createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          ownerId == other.ownerId &&
          items == other.items &&
          createdAt == other.createdAt);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ ownerId.hashCode ^ items.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'ListEntity{ id: $id, name: $name, ownerId: $ownerId, items: $items, createdAt: $createdAt,}';
  }

  ListEntity copyWith({
    String? id,
    String? name,
    String? ownerId,
    List<ItemEntity>? items,
    DateTime? createdAt,
  }) {
    return ListEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
