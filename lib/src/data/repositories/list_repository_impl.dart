import 'package:dartz/dartz.dart';

import '../../src.dart';

class ListRepositoryImpl extends ListRepository {
  ListRepositoryImpl(this._dataSource);

  final ListRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, ListEntity>> fetch({required String id}) async {
    try {
      return Right(await _dataSource.fetch(id: id));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListEntity>> create() async {
    try {
      return Right(await _dataSource.create());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
