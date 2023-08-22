import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../src.dart';

class UserRemoteDataSource {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<UserEntity> create({required String username}) async {
    try {
      final docId = users.doc().id;
      await users.doc(docId).set({'id': docId, 'username': username});
      final userSnapshot = await users.doc(docId).get();
      final userData = userSnapshot.data() as Map<String, dynamic>;
      return UserEntityMapper.fromJson(userData);
    } catch (e) {
      throw Exception('UserRemoteDataSourceException.create: $e');
    }
  }

  Future<UserEntity> fetch({required String username}) async {
    try {
      final userDocs = (await users.where('username', isEqualTo: username).get()).docs;
      for (var doc in userDocs) {
        final userData = doc.data() as Map<String, dynamic>;
        if (userData['username'] == username) {
          userData['id'] = doc.id;
          return UserEntityMapper.fromJson(userData);
        }
      }
      throw Exception('Could not find user');
    } catch (e) {
      throw Exception('UserRemoteDataSourceException.fetch: $e');
    }
  }
}
