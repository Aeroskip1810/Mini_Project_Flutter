import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDJLtAUIQHk854MbkctWrrQQd8oEx-GEzA',
    appId: '1:68405694623:web:56982d2fa1abad9ca4d2aa',
    messagingSenderId: '68405694623',
    projectId: 'crud-75ac9',
    authDomain: 'crud-75ac9.firebaseapp.com',
    storageBucket: 'crud-75ac9.appspot.com',
    measurementId: 'G-6YDCV2KJWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrKyeIiyUR59wGrbug0ecwuC7I_iNSn0s',
    appId: '1:68405694623:android:9567d14b69939f94a4d2aa',
    messagingSenderId: '68405694623',
    projectId: 'crud-75ac9',
    storageBucket: 'crud-75ac9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqaeissioz-jwg8lkbjtpsZKX2D-rt9CM',
    appId: '1:68405694623:ios:dd6a61ec10548ca8a4d2aa',
    messagingSenderId: '68405694623',
    projectId: 'crud-75ac9',
    storageBucket: 'crud-75ac9.appspot.com',
    iosBundleId: 'com.example.miniProjectFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqaeissioz-jwg8lkbjtpsZKX2D-rt9CM',
    appId: '1:68405694623:ios:4239e51ac1863107a4d2aa',
    messagingSenderId: '68405694623',
    projectId: 'crud-75ac9',
    storageBucket: 'crud-75ac9.appspot.com',
    iosBundleId: 'com.example.miniProjectFlutter.RunnerTests',
  );
}
