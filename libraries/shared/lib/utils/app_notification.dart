import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/utlis.dart';

class AppNotification {
  AppNotification._();
  static BuildContext? context;

  // static final FirebaseMessaging _firebaseMessaging =
  //     FirebaseMessaging.instance;

  static Future<void> init() async {
    // await _firebaseMessaging.requestPermission();
    // await _initNotificationProvider();
    // await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   log('AppNotif, isNotificationAllowed = $isAllowed');
    //   // if (!isAllowed) {
    //   //   try {
    //   //     AwesomeNotifications().requestPermissionToSendNotifications();
    //   //   } catch (e) {
    //   //     log('AppNotif, catch = $e');
    //   //   }
    //   // }
    // });

    // FirebaseMessaging.onMessage.listen((event) {
    //   log('AppNotif, onMessage = ${event.data}');
    //   _notificationReceiver(event.data);
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   logI('AppNotif, onMessageOpenedApp = ${event.data}');

    //   if (event.data.containsKey('type')) {
    //     final type = event.data['type'] as String;
    //     final id =
    //         _getId(jsonDecode(event.data['data']) as Map<String, dynamic>);

    //     if (context != null) {
    //       if (type == 'vehicle_reservation') {
    //         context?.go(NamedRoutes.detailVehicleRes, extra: id);
    //       } else if (type == 'room_reservation') {
    //         context?.go(NamedRoutes.detailRoom, extra: id);
    //       }
    //     } else {
    //       logE('.AppNotif, context null bro');
    //     }
    //   }
    // });

    // FirebaseMessaging.onBackgroundMessage(
    //     (message) => _notificationReceiver(message.data));

    // await FirebaseMessaging.instance.getInitialMessage().then((value) {
    //   if (value != null) {
    //     logI('AppNotif, getInitialMessage = ${value.data.values}');

    //     if (value.data.containsKey('type')) {
    //       final type = value.data['type'] as String;
    //       final id =
    //           _getId(jsonDecode(value.data['data']) as Map<String, dynamic>);

    //       if (context != null) {
    //         if (type == 'vehicle_reservation') {
    //           context?.push(NamedRoutes.detailVehicleRes, extra: id);
    //         } else if (type == 'room_reservation') {
    //           context?.push(NamedRoutes.detailRoom, extra: id);
    //         }
    //       } else {
    //         logE('.AppNotif, context null bro');
    //       }
    //     }
    //   }
    // });
  }

  static Future<String?> getDeviceToken() async {
    //return _firebaseMessaging.getToken();
  }

  static Future<void> _notificationReceiver(Map<dynamic, dynamic> data) async {
    switch (data['type']) {
      case 'room_reservation':
        await _sendNotification(
            _getId(jsonDecode(data['data']) as Map<String, dynamic>),
            title: data['title'] as String,
            body: data['description'] as String,
            channelKey: 'room_reservation',
            groupKey: 'room_group',
            payload: _payLoad(data));
        break;
      case 'vehicle_reservation':
        await _sendNotification(
            _getId(jsonDecode(data['data']) as Map<String, dynamic>),
            title: data['title'] as String,
            body: data['description'] as String,
            channelKey: 'vehicle_reservation',
            groupKey: 'vehicle_group',
            payload: _payLoad(data));
        break;
      default:
        await _sendNotification(1,
            title: data['title'] as String,
            body: data['description'] as String,
            channelKey: 'default_channel_poas',
            groupKey: 'default_group',
            payload: _payLoad(data));
    }
  }

  static Map<String, String> _payLoad(Map<dynamic, dynamic> data) {
    final map = <String, String>{};
    map['type'] = data['type'];
    map['id_notif'] = data['id_notif'];
    logI('payload = $map');
    return map;
  }

  static int _getId(Map<String, dynamic> map) {
    const id = 0;
    if (map.containsKey('id')) {
      return map['id'];
    }

    logI('id = $id');
    return id;
  }

  static Future<void> _initNotificationProvider() async {
    await AwesomeNotifications()
        .initialize(
            // set the icon to null if you want to use the default app icon
            'resource://drawable/ic_color_notif',
            [
              NotificationChannel(
                  channelGroupKey: 'basic_channel_group',
                  channelKey: 'basic_channel',
                  channelName: 'Basic notifications',
                  channelDescription: 'Notification channel for basic tests',
                  defaultColor: AppColors.primaryColor,
                  importance: NotificationImportance.High,
                  ledColor: Colors.white),
              NotificationChannel(
                  channelGroupKey: 'default_group',
                  channelKey: 'default_channel_paos',
                  channelName: 'Default notifications',
                  channelDescription: 'Notification channel for Default',
                  importance: NotificationImportance.High,
                  defaultColor: AppColors.primaryColor,
                  ledColor: Colors.white),
              NotificationChannel(
                  channelGroupKey: 'room_group',
                  channelKey: 'room_reservation',
                  channelName: 'Room notifications',
                  importance: NotificationImportance.High,
                  channelDescription: 'Notification channel for Room',
                  defaultColor: AppColors.primaryColor,
                  ledColor: Colors.white),
              NotificationChannel(
                  channelGroupKey: 'vehicle_group',
                  channelKey: 'vehicle_reservation',
                  channelName: 'Vehicle notifications',
                  importance: NotificationImportance.High,
                  channelDescription: 'Notification channel for vehicle',
                  defaultColor: AppColors.primaryColor,
                  ledColor: Colors.white),
            ],
            debug: false)
        .whenComplete(
            () => logI('AwesomeNotification initialized! Notification'));
  }

  static Future<void> _sendNotification(int id,
      {required String title,
      required String body,
      String channelKey = 'basic_channel',
      String groupKey = 'basic_channel_group',
      required Map<String, String> payload}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        groupKey: groupKey,
        displayOnBackground: true,
        displayOnForeground: true,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  }

  static Future<void> callbackNotification(BuildContext context) async {
    try {
      await AwesomeNotifications().setListeners(
        onNotificationCreatedMethod: (receivedNotification) =>
            AppNotificationController.onNotificationCreatedMethod(
                context, receivedNotification),
        onActionReceivedMethod: (receivedAction) =>
            AppNotificationController.onActionReceivedMethod(
                context, receivedAction),
      );
    } catch (err) {
      debugPrint(
          'AwesomeNotification().actionStream has already been listened to.');
    } finally {
      debugPrint(
          'AwesomeNotification().actionStream has already been listened to.');
    }
  }
}
