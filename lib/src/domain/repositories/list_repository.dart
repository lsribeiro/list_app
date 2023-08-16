import 'package:dartz/dartz.dart';
import 'dart:core';

import '../../src.dart';

abstract class ListRepository {
  Future<Either<Failure, ListEntity>> create();
  Future<Either<Failure, ListEntity>> fetch({required String id});
}
