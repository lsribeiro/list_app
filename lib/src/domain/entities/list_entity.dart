class ListEntity {
  const ListEntity({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ListEntity{ title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt,}';
  }

  ListEntity copyWith({
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ListEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ListEntity.fromMap(Map<String, dynamic> map) {
    return ListEntity(
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: map['createdAt'] as DateTime,
      updatedAt: map['updatedAt'] as DateTime,
    );
  }
}
