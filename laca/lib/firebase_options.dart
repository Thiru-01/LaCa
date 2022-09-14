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
    apiKey: 'AIzaSyChv86DwXHObanlwtk7PyHNqd5SWR3uglo',
    appId: '1:1058584653122:web:fe0eab1c2ad7fd20cf6cdb',
    messagingSenderId: '1058584653122',
    projectId: 'laca-a2043',
    authDomain: 'laca-a2043.firebaseapp.com',
    storageBucket: 'laca-a2043.appspot.com',
    measurementId: 'G-RQ6056QB20',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiHvSlJd48_-O7jEUaB3aoGHhxZFMG0WE',
    appId: '1:1058584653122:android:7c2e99ee3102f5d5cf6cdb',
    messagingSenderId: '1058584653122',
    projectId: 'laca-a2043',
    storageBucket: 'laca-a2043.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxNedsOz-SV0iFSvK-HHRTbjp0oiFeM6E',
    appId: '1:1058584653122:ios:7287de23e0169734cf6cdb',
    messagingSenderId: '1058584653122',
    projectId: 'laca-a2043',
    storageBucket: 'laca-a2043.appspot.com',
    iosClientId: '1058584653122-2s6iu23cbvur4phede81gl3e4l3fcrt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.laca',
  );
}
