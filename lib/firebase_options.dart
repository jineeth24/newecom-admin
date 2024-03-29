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
    apiKey: 'AIzaSyBSF8SEAgzAeswzQ0xQd_7PsiqYpybWDM8',
    appId: '1:1055216832555:web:f57650ac3920fdda661a6e',
    messagingSenderId: '1055216832555',
    projectId: 'newecom-4bb29',
    authDomain: 'newecom-4bb29.firebaseapp.com',
    storageBucket: 'newecom-4bb29.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOqY_y7kDnNbRi5EWNAbg7AusxuNzYC88',
    appId: '1:1055216832555:android:ffa1cf07b6a67fe7661a6e',
    messagingSenderId: '1055216832555',
    projectId: 'newecom-4bb29',
    storageBucket: 'newecom-4bb29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKebAOQwJOzJrmw8DuFxYErGjlcqCdjFs',
    appId: '1:1055216832555:ios:e2e00e782c355c63661a6e',
    messagingSenderId: '1055216832555',
    projectId: 'newecom-4bb29',
    storageBucket: 'newecom-4bb29.appspot.com',
    iosBundleId: 'com.example.newecomadmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKebAOQwJOzJrmw8DuFxYErGjlcqCdjFs',
    appId: '1:1055216832555:ios:a988f5bf07e02623661a6e',
    messagingSenderId: '1055216832555',
    projectId: 'newecom-4bb29',
    storageBucket: 'newecom-4bb29.appspot.com',
    iosBundleId: 'com.example.newecomadmin.RunnerTests',
  );
}
