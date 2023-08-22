import '../../src.dart';

class UserEntityMapper {
  static Map<String, dynamic> toJson(UserEntity user) {
    return {
      'id': user.id,
      'username': user.username,
    };
  }

  static UserEntity fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      username: map['username'] as String,
    );
  }
}
