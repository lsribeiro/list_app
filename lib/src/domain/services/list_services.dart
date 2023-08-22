import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../src.dart';

class ListServices {
  ListServices(this._repository, this._userServices);

  final ListRepositoryImpl _repository;
  final UserServices _userServices;

  static ListServices get instance => GetIt.instance.get<ListServices>();

  Future<Either<Failure, ListEntity>> fetch({required String id}) => _repository.fetch(id: id);

  Future<Either<Failure, ListEntity>> create({required String name}) async {
    try {
      final userResult = await _userServices.fetchCurrentUser();
      final user = userResult.fold((l) => null, (r) => r);

      if (user != null) {
        return _repository.create(name: name, ownerId: user.id);
      }
      throw Exception('Could not find current user');
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
