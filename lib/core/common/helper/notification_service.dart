import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Android-specific initialization
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialization settings for all platforms
    const InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification actions here
        if (response.payload == 'answer') {
          print('Answer action tapped');
          // Add logic to open call screen or handle answer action
        } else if (response.payload == 'decline') {
          print('Decline action tapped');
          // Add logic to decline the call
        }
      },
    );

    // Create a notification channel (for Android)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('loud_notification'), // custom sound
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Print the FCM token
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token"); // Print the FCM token to the console
    });

    // Listen to incoming messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    // Set the background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // Background message handler
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await showNotification(message);
  }

  static Future<void> showNotification(RemoteMessage message) async {
    // Configure Android-specific notification details with actions
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'high_importance_channel', // channel ID
      'High Importance Notifications', // channel name
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('loud_notification'), // custom sound
      timeoutAfter: 900000, // Duration: 5 minutes in milliseconds
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('answer', 'Answer'),
        AndroidNotificationAction('decline', 'Decline'),
      ],
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    // Show the notification
    await _notificationsPlugin.show(
      0, // Notification ID
      message.notification?.title ?? 'Incoming Call', // Title
      message.notification?.body ?? 'Someone is calling...', // Body
      notificationDetails,
      payload: 'incoming_call', // Custom payload to identify notification type
    );
  }
}
