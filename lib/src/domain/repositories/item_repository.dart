import 'package:dartz/dartz.dart';
import 'dart:core';

import '../../src.dart';

abstract class ItemRepository {
  Future<Either<Failure, ItemEntity>> create({
    required String listId,
    required String title,
    required String description,
  });

  Future<Either<Failure, ItemEntity>> update({
    required String itemId,
    required String listId,
    required String title,
    required String description,
  });

  Future<Either<Failure, void>> delete({
    required String itemId,
    required String listId,
  });

  Future<Either<Failure, List<ItemEntity>>> search({
    required String listId,
    required String query,
  });
}
