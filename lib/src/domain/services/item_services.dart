import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../src.dart';

class ItemServices {
  ItemServices(this._repository);

  final ItemRepositoryImpl _repository;

  static ItemServices get instance => GetIt.instance.get<ItemServices>();

  Future<Either<Failure, ItemEntity>> create({
    required String listId,
    required String title,
    required String description,
  }) =>
      _repository.create(
        listId: listId,
        title: title,
        description: description,
      );

  Future<Either<Failure, ItemEntity>> update({
    required String listId,
    required String itemId,
    required String title,
    required String description,
  }) =>
      _repository.update(
        itemId: itemId,
        listId: listId,
        title: title,
        description: description,
      );

  Future<Either<Failure, void>> delete({
    required String listId,
    required String itemId,
  }) =>
      _repository.delete(
        itemId: itemId,
        listId: listId,
      );

  Future<Either<Failure, List<ItemEntity>>> search({
    required String listId,
    required String query,
  }) =>
      _repository.search(
        listId: listId,
        query: query,
      );
}
