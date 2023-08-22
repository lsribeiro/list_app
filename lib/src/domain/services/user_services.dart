import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../src.dart';

class UserServices {
  UserServices(this._repository);

  final UserRepositoryImpl _repository;

  static UserServices get instance => GetIt.instance.get<UserServices>();

  Future<Either<Failure, UserEntity?>> login({required String username}) async {
    try {
      final fetchResult = await _repository.fetch(username: username);
      UserEntity? user;
      user = fetchResult.fold((l) => null, (r) => r);

      if (user == null) {
        final createResult = await _repository.create(username: username);
        user = createResult.fold((l) => null, (r) => r);
      }
      if (user != null) {
        await _repository.storeCurrentUser(user: user);
      }

      return Right(user); // TODO: improve this
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, UserEntity>> fetchCurrentUser() async {
    try {
      final fetchResult = await _repository.fetchCurrentUser();
      return fetchResult;
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
