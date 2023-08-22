import 'package:dartz/dartz.dart';
import 'dart:core';

import '../../src.dart';

abstract class ListRepository {
  Future<Either<Failure, ListEntity>> create({required String name, required String ownerId});
  Future<Either<Failure, ListEntity>> fetch({required String id});
}
