import 'package:dartz/dartz.dart';
import 'dart:core';

import '../../src.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> create({required String username});
  Future<Either<Failure, UserEntity>> fetch({required String username});
  Future<Either<Failure, void>> storeCurrentUser({required UserEntity user});
  Future<Either<Failure, UserEntity>> fetchCurrentUser();
}
