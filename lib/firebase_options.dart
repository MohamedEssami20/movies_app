// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBKD0SsPghcM-hNGkemFb10ZUoel4DY-zc',
    appId: '1:1072040824484:web:e5259606da7a2a0e6a2031',
    messagingSenderId: '1072040824484',
    projectId: 'movies-app-ed764',
    authDomain: 'movies-app-ed764.firebaseapp.com',
    storageBucket: 'movies-app-ed764.firebasestorage.app',
    measurementId: 'G-41DSNETLRW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGYPCoAkw0lwI4mA9lOm5dj3KjxolVhyo',
    appId: '1:1072040824484:android:03c16e74bc3dbd9d6a2031',
    messagingSenderId: '1072040824484',
    projectId: 'movies-app-ed764',
    storageBucket: 'movies-app-ed764.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsAjEY213-dhoPqI4Dh_Aw4BUgAAmvbdc',
    appId: '1:1072040824484:ios:72ea0e89b6b7aa646a2031',
    messagingSenderId: '1072040824484',
    projectId: 'movies-app-ed764',
    storageBucket: 'movies-app-ed764.firebasestorage.app',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsAjEY213-dhoPqI4Dh_Aw4BUgAAmvbdc',
    appId: '1:1072040824484:ios:72ea0e89b6b7aa646a2031',
    messagingSenderId: '1072040824484',
    projectId: 'movies-app-ed764',
    storageBucket: 'movies-app-ed764.firebasestorage.app',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBKD0SsPghcM-hNGkemFb10ZUoel4DY-zc',
    appId: '1:1072040824484:web:9362279cc9ac9af96a2031',
    messagingSenderId: '1072040824484',
    projectId: 'movies-app-ed764',
    authDomain: 'movies-app-ed764.firebaseapp.com',
    storageBucket: 'movies-app-ed764.firebasestorage.app',
    measurementId: 'G-8VC0NYWWPH',
  );
}
