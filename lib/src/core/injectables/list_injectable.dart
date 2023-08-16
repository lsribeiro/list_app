import '../../src.dart';

class ListInjectable extends Injectable {
  @override
  void attach() {
    _attachDataSources();
    _attachRepositories();
    _attachServices();
  }

  void _attachDataSources() {
    injector.registerLazySingleton(() => ListRemoteDataSource());
  }

  void _attachRepositories() {
    injector.registerLazySingleton(() => ListRepositoryImpl(injector.get<ListRemoteDataSource>()));
  }

  void _attachServices() {
    injector.registerLazySingleton(() => ListServices(injector.get<ListRepositoryImpl>()));
  }
}
