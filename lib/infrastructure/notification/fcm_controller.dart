
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/src/platform_specifics/android/enums.dart' as ENUMS;
import 'package:get/get.dart';


class FCMController  {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late DarwinInitializationSettings iOSSettings;
  late AndroidNotificationChannel channel;


  Future<void> initFCM() async {
    // Request permissions for iOS
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    log("FCM init method calls with iOS permission status: ${settings.authorizationStatus}");

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      playSound: true,
    );

    // Updated iOS initialization settings
    iOSSettings = DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    await getFCMToken();
    listenMessage();
  }

  Future<String?> getFCMToken() async {
    configLocalNotification();
    final fcmToken = await firebaseMessaging.getToken();

    // Create notification channel for Android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    log('FCM Token : $fcmToken');
    return fcmToken;
  }

  listenMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log("Received message: ${message.data}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;
      log("notificationios $notification");

      if (notification != null) {
        try {
          await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                priority: ENUMS.Priority.high,
              ),
              iOS: DarwinNotificationDetails(
                  presentAlert: true, // Show alert
                  presentBadge: true, // Update badge
                  presentSound: true, // Play sound
                  sound: 'default', // Use default sound
                  badgeNumber: 1,
                  subtitle: notification.title
                // Set badge number
              ),
            ),
            payload: jsonEncode(message.data),
          );
        } catch (e, s) {
          log("Error showing notification: $e\n$s");
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('App opened from notification: ${message.data}');
      handleNotificationPayload(message.data);
    });
  }


  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    // Handle iOS foreground notification
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: body != null ? Text(body) : null,
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              if (payload != null) {
                // Handle payload
                var data = jsonDecode(payload);
                handleNotificationPayload(data);
              }
            },
          )
        ],
      ),
    );
  }

  void configLocalNotification() {
    var androidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          var data = jsonDecode(response.payload!);
          handleNotificationPayload(data);
        }
      },
    );
  }

  void handleNotificationPayload(Map<String, dynamic> data) {
    final urlTitle = data['urlTitle'];
    final userNotificationEventId = data['userNotificationEventId'];

    if (userNotificationEventId.toString().toLowerCase() == "post") {
      // Handle post notification
    }

    if (userNotificationEventId.toString().toLowerCase() == "community") {
      // Handle community notification
    }
  }




}
