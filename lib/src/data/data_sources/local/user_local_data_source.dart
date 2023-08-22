import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localstorage/localstorage.dart';

import '../../../src.dart';

class UserLocalDataSource {
  final LocalStorage storage = LocalStorage('list_app');

  Future<void> storeCurrentUser({
    required UserEntity user,
  }) async {
    try {
      final userMap = UserEntityMapper.toJson(user);
      await storage.ready;
      await storage.setItem('currentUser', userMap);
    } catch (e) {
      throw Exception('UserLocalDataSourceException.store: $e');
    }
  }

  Future<UserEntity> fetchCurrentUser() async {
    try {
      await storage.ready;
      final userMap = await storage.getItem('currentUser') as Map<String, dynamic>;
      return UserEntityMapper.fromJson(userMap);
    } catch (e) {
      throw Exception('UserLocalDataSourceException.store: $e');
    }
  }
}
