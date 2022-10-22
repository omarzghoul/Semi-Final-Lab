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
    apiKey: 'AIzaSyAB7vTDLHiSCu7lX-CFsaHE-KlqvbLFxQY',
    appId: '1:520434663380:web:7efef328243499beb0e041',
    messagingSenderId: '520434663380',
    projectId: 'semi-final-lab-3b0af',
    authDomain: 'semi-final-lab-3b0af.firebaseapp.com',
    storageBucket: 'semi-final-lab-3b0af.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8Dwdaf6sW9CqDTGEjbJ20WN16dgFnhSE',
    appId: '1:520434663380:android:eaf4bc748bb4428eb0e041',
    messagingSenderId: '520434663380',
    projectId: 'semi-final-lab-3b0af',
    storageBucket: 'semi-final-lab-3b0af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQjzMrQewe2fnqd_5bfKhNnjR-RuarASo',
    appId: '1:520434663380:ios:e0c0fbab64378470b0e041',
    messagingSenderId: '520434663380',
    projectId: 'semi-final-lab-3b0af',
    storageBucket: 'semi-final-lab-3b0af.appspot.com',
    iosClientId: '520434663380-4v9qmmruaai2e2gbl4e5g2hu2tphm79a.apps.googleusercontent.com',
    iosBundleId: 'com.example.citycafeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQjzMrQewe2fnqd_5bfKhNnjR-RuarASo',
    appId: '1:520434663380:ios:e0c0fbab64378470b0e041',
    messagingSenderId: '520434663380',
    projectId: 'semi-final-lab-3b0af',
    storageBucket: 'semi-final-lab-3b0af.appspot.com',
    iosClientId: '520434663380-4v9qmmruaai2e2gbl4e5g2hu2tphm79a.apps.googleusercontent.com',
    iosBundleId: 'com.example.citycafeApp',
  );
}