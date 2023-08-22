class UserEntity {
  const UserEntity({
    required this.id,
    required this.username,
  });

  final String id;
  final String username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity && runtimeType == other.runtimeType && id == other.id && username == other.username);

  @override
  int get hashCode => id.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'UserEntity{ id: $id, username: $username,}';
  }

  UserEntity copyWith({
    String? id,
    String? username,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }
}
