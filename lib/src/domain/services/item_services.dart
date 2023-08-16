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
}
