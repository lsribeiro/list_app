import 'package:dartz/dartz.dart';

import '../../src.dart';

class ItemRepositoryImpl extends ItemRepository {
  ItemRepositoryImpl(this._dataSource);

  final ItemRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, ItemEntity>> create({
    required String listId,
    required String title,
    required String description,
  }) async {
    try {
      return Right(await _dataSource.create(
        listId: listId,
        title: title,
        description: description,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
