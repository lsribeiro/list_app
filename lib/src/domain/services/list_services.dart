import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../src.dart';

class ListServices {
  ListServices(this._repository);

  final ListRepositoryImpl _repository;

  static ListServices get instance => GetIt.instance.get<ListServices>();

  Future<Either<Failure, ListEntity>> fetch({required String id}) => _repository.fetch(id: id);
  Future<Either<Failure, ListEntity>> create() => _repository.create();
}
