import 'package:uuid/uuid.dart';

import '../../../src.dart';

class ListRemoteDataSource {
  Future<ListEntity> create() async {
    try {
      final id = const Uuid().v4();
      final list = ListEntityMapper.toJson(
        ListEntity(
          id: id,
          createdAt: DateTime.now(),
          items: [
            ItemEntity(
              listId: id,
              id: '1',
              title: 'Item',
              description: 'Description',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ],
        ),
      );
      Config.storage.setItem(
        'list',
        list,
      );

      final listMap = await Config.storage.getItem('list');
      return ListEntityMapper.fromJson(listMap);
    } catch (e) {
      throw Exception('ListRemoteDataSourceException.create: $e');
    }
  }

  Future<ListEntity> fetch({required String id}) async {
    try {
      final listMap = await Config.storage.getItem('list');
      return ListEntityMapper.fromJson(listMap);
    } catch (e) {
      throw Exception('ListRemoteDataSourceException.fetch: $e');
    }
  }
}
