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
    apiKey: 'AIzaSyCmd3NSjP83FH3EvOeTWj72Bv7hmSyeQUA',
    appId: '1:617333452165:web:811435cd3d467d4a4a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    authDomain: 'projectauth-50b3e.firebaseapp.com',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    measurementId: 'G-WWJR6TKRVK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_Emn6_QmfxK1uRaPhmkcW1DkFi4gsick',
    appId: '1:617333452165:android:bd55c2fc10f536594a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjqU4cxuDFMYtDuolnarSfRcgUWtpuZWQ',
    appId: '1:617333452165:ios:729c052d309fbd344a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    iosBundleId: 'com.example.shoppingApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjqU4cxuDFMYtDuolnarSfRcgUWtpuZWQ',
    appId: '1:617333452165:ios:729c052d309fbd344a28ec',
    messagingSenderId: '617333452165',
    projectId: 'projectauth-50b3e',
    storageBucket: 'projectauth-50b3e.firebasestorage.app',
    iosBundleId: 'com.example.shoppingApplication',
  );
}