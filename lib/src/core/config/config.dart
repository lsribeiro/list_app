import 'package:list_app/src/src.dart';
import 'package:localstorage/localstorage.dart';

class Config {
  static final LocalStorage storage = LocalStorage('list_app'); // TODO: temp storage

  static void init() {
    _setupInjector();
  }

  static void _setupInjector() {
    ListInjectable().attach();
    ItemInjectable().attach();
  }
}
