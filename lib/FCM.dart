import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class FCM {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final streamCtlr = StreamController<String>.broadcast();

  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  setNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      streamCtlr.sink.add(message.data['msg']);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onLaunch: $message");
    });

    final token = FirebaseMessaging.instance.getToken().then((value) => print(value));
  }

  dispose() {
    streamCtlr?.close();
  }
}
