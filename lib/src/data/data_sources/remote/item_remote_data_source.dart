import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../src.dart';

class ItemRemoteDataSource {
  final CollectionReference lists = FirebaseFirestore.instance.collection('lists');

  Future<ItemEntity> create({
    required String listId,
    required String title,
    required String description,
  }) async {
    try {
      final docId = lists.doc(listId).collection('items').doc().id;
      await lists.doc(listId).collection('items').doc(docId).set({
        'id': docId,
        'title': title,
        'listId': listId,
        'description': description,
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
      });
      final itemSnapshot = await lists.doc(listId).collection('items').doc(docId).get();
      final itemData = itemSnapshot.data() as Map<String, dynamic>;
      return ItemEntityMapper.fromJson(itemData);
    } catch (e) {
      throw Exception('ItemRemoteDataSourceException.create: $e');
    }
  }

  Future<ItemEntity> update({
    required String itemId,
    required String listId,
    required String title,
    required String description,
  }) async {
    try {
      await lists.doc(listId).collection('items').doc(itemId).set({
        'title': title,
        'description': description,
        'updatedAt': Timestamp.now(),
      }, SetOptions(merge: true));
      final itemSnapshot = await lists.doc(listId).collection('items').doc(itemId).get();
      final itemData = itemSnapshot.data() as Map<String, dynamic>;
      return ItemEntityMapper.fromJson(itemData);
    } catch (e) {
      throw Exception('ItemRemoteDataSourceException.create: $e');
    }
  }

  Future<void> delete({
    required String itemId,
    required String listId,
  }) async {
    try {
      await lists.doc(listId).collection('items').doc(itemId).delete();
    } catch (e) {
      throw Exception('ItemRemoteDataSourceException.create: $e');
    }
  }

  Future<List<ItemEntity>> search({
    required String listId,
    required String query,
  }) async {
    try {
      final itemsRef = await lists
          .doc(listId)
          .collection('items')
          .where(
            'title',
            isGreaterThanOrEqualTo: query,
            isLessThan:
                query.substring(0, query.length - 1) + String.fromCharCode(query.codeUnitAt(query.length - 1) + 1),
          )
          .get();
      final items = itemsRef.docs.map<ItemEntity>((e) => ItemEntityMapper.fromJson(e.data())).toList();
      return items;
    } catch (e) {
      throw Exception('ItemRemoteDataSourceException.create: $e');
    }
  }
}
