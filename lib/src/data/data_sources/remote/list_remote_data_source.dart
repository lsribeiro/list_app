import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../src.dart';

class ListRemoteDataSource {
  final CollectionReference lists = FirebaseFirestore.instance.collection('lists');

  Future<ListEntity> create({
    required String name,
    required String ownerId,
  }) async {
    try {
      final docId = lists.doc().id;
      await lists.doc(docId).set({
        'id': docId,
        'name': name,
        'ownerId': ownerId,
        'createdAt': Timestamp.now(),
      });
      final listSnapshot = await lists.doc(docId).get();

      final listData = listSnapshot.data() as Map<String, dynamic>;
      return ListEntityMapper.fromJson(listData);
    } catch (e) {
      throw Exception('ListRemoteDataSourceException.create: $e');
    }
  }

  Future<ListEntity> fetch({required String id}) async {
    try {
      final listRef = await lists.doc(id).get();
      final itemsRef = await lists.doc(id).collection('items').get();
      final listData = listRef.data() as Map<String, dynamic>;
      final items = <Map<String, dynamic>>[];
      for (var item in itemsRef.docs) {
        items.add(item.data());
      }
      listData['items'] = items;

      return ListEntityMapper.fromJson(listData);
    } catch (e) {
      throw Exception('ListRemoteDataSourceException.fetch: $e');
    }
  }
}
