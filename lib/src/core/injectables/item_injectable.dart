import '../../src.dart';

class ItemInjectable extends Injectable {
  @override
  void attach() {
    _attachDataSources();
    _attachRepositories();
    _attachServices();
  }

  void _attachDataSources() {
    injector.registerLazySingleton(() => ItemRemoteDataSource());
  }

  void _attachRepositories() {
    injector.registerLazySingleton(() => ItemRepositoryImpl(injector.get<ItemRemoteDataSource>()));
  }

  void _attachServices() {
    injector.registerLazySingleton(() => ItemServices(injector.get<ItemRepositoryImpl>()));
  }
}
