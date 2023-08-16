import '../../../src.dart';

class ItemRemoteDataSource {
  Future<ItemEntity> create({
    required String listId,
    required String title,
    required String description,
  }) async {
    try {
      return ItemEntity(
        id: DateTime.now().toString(),
        listId: listId,
        title: title,
        description: description,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } catch (e) {
      throw Exception('ItemRemoteDataSourceException.create: $e');
    }
  }
}
