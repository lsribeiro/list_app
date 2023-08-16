class ItemEntity {
  const ItemEntity({
    required this.id,
    required this.listId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String listId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
}
