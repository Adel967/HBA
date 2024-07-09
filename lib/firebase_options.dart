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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAzvBaC2eRymQpHySl-9ftag9FVyZgykwY',
    appId: '1:615779667628:web:a607f195057eabc1e31909',
    messagingSenderId: '615779667628',
    projectId: 'hba-hotel',
    authDomain: 'hba-hotel.firebaseapp.com',
    storageBucket: 'hba-hotel.appspot.com',
    measurementId: 'G-T2RG8EW3SJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQDSiV3yo-0xLevZjmxe8sBxcSKyaTgTo',
    appId: '1:615779667628:android:a3428354d1b48853e31909',
    messagingSenderId: '615779667628',
    projectId: 'hba-hotel',
    storageBucket: 'hba-hotel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDArWSejG3Z0corgSOYu_0oIF1xupksBYE',
    appId: '1:615779667628:ios:2602a52adb73420de31909',
    messagingSenderId: '615779667628',
    projectId: 'hba-hotel',
    storageBucket: 'hba-hotel.appspot.com',
    iosBundleId: 'com.example.hba',
  );
}
