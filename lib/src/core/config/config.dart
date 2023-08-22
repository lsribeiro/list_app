import 'package:firebase_core/firebase_core.dart';
import 'package:list_app/src/src.dart';

import '../../../firebase_options.dart';

class Config {
  static void init() {
    _setupInjector();
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void _setupInjector() {
    UserInjectable().attach();
    ListInjectable().attach();
    ItemInjectable().attach();
  }
}
