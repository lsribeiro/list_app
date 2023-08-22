// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCP-2VqbQfoK5882uJjRJ4_csXpLFcH-w',
    appId: '1:405093981393:web:8c066e8abfa60c6c1539f0',
    messagingSenderId: '405093981393',
    projectId: 'listapp-e0771',
    authDomain: 'listapp-e0771.firebaseapp.com',
    storageBucket: 'listapp-e0771.appspot.com',
    measurementId: 'G-D4216E3MBH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpL1eohI84CcllC70aAnsqRvoJVTLBSuQ',
    appId: '1:405093981393:android:fd41f35bb0b0e9e81539f0',
    messagingSenderId: '405093981393',
    projectId: 'listapp-e0771',
    storageBucket: 'listapp-e0771.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQ6EnZMhmPCu5Lao92S1qnYmOC_6Bb4rM',
    appId: '1:405093981393:ios:1b4e22aa137cd9bd1539f0',
    messagingSenderId: '405093981393',
    projectId: 'listapp-e0771',
    storageBucket: 'listapp-e0771.appspot.com',
    iosClientId: '405093981393-6vs5f7tr2lif7et7kvquhnc94t6rcg2s.apps.googleusercontent.com',
    iosBundleId: 'com.example.listApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQ6EnZMhmPCu5Lao92S1qnYmOC_6Bb4rM',
    appId: '1:405093981393:ios:3d4e870bdb089d711539f0',
    messagingSenderId: '405093981393',
    projectId: 'listapp-e0771',
    storageBucket: 'listapp-e0771.appspot.com',
    iosClientId: '405093981393-64evd9s1nl1qt50gqupne80op4p34ijf.apps.googleusercontent.com',
    iosBundleId: 'com.example.listApp.RunnerTests',
  );
}
