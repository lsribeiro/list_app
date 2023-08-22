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

  @override
  Future<Either<Failure, ItemEntity>> update({
    required String itemId,
    required String listId,
    required String title,
    required String description,
  }) async {
    try {
      return Right(await _dataSource.update(
        itemId: itemId,
        listId: listId,
        title: title,
        description: description,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete({
    required String itemId,
    required String listId,
  }) async {
    try {
      return Right(await _dataSource.delete(
        itemId: itemId,
        listId: listId,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> search({
    required String listId,
    required String query,
  }) async {
    try {
      return Right(await _dataSource.search(
        listId: listId,
        query: query,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
