import 'package:dartz/dartz.dart';

import '../../src.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, UserEntity>> fetch({required String username}) async {
    try {
      return Right(await _remoteDataSource.fetch(username: username));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> create({required String username}) async {
    try {
      return Right(await _remoteDataSource.create(username: username));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchCurrentUser() async {
    try {
      return Right(await _localDataSource.fetchCurrentUser());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> storeCurrentUser({required UserEntity user}) async {
    try {
      return Right(await _localDataSource.storeCurrentUser(user: user));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
