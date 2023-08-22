import '../../src.dart';

class UserInjectable extends Injectable {
  @override
  void attach() {
    _attachDataSources();
    _attachRepositories();
    _attachServices();
  }

  void _attachDataSources() {
    injector.registerLazySingleton(() => UserRemoteDataSource());
    injector.registerLazySingleton(() => UserLocalDataSource());
  }

  void _attachRepositories() {
    injector.registerLazySingleton(
        () => UserRepositoryImpl(injector.get<UserRemoteDataSource>(), injector.get<UserLocalDataSource>()));
  }

  void _attachServices() {
    injector.registerLazySingleton(() => UserServices(injector.get<UserRepositoryImpl>()));
  }
}
