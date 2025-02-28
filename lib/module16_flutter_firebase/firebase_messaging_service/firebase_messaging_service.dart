import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission(
      sound: true,
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
  }

  Future<void> initialize() async {
    await requestPermission();

    /// App State -> Normal/Alive/On-Pause
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });

    /// App State -> Open/Resume
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });

    /// App State -> Open/Resume
    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
  }

  Future<void> getFCMToken() async {
    final token = await _firebaseMessaging.getToken();
    print("Token: $token");
  }

  Future<void> onRefresh(Function(String) onTokenRefresh) async {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      onTokenRefresh(token);
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeToTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

Future<void> handleBackgroundNotification(RemoteMessage message) async {}
