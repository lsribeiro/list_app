import 'package:dartz/dartz.dart';
import 'dart:core';

import '../../src.dart';

abstract class ItemRepository {
  Future<Either<Failure, ItemEntity>> create({
    required String listId,
    required String title,
    required String description,
  });
}
