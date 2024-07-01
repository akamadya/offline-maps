import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/log_debug_console.dart';

class AppNotificationController {
  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(
      BuildContext context, ReceivedNotification receivedNotification) async {
    // Your code goes here

    logI(
        '.AppNotification, receivedNotification channelKey = $receivedNotification');

    final idNotif = receivedNotification.payload != null
        ? receivedNotification.payload?.containsKey('id_notif') ?? false
            ? receivedNotification.payload!['id_notif']
            : '0'
        : '0';

    //   context.read<CheckNotifBloc>().add(CheckNotif(
    //       idNotif: int.parse(idNotif ?? '0'),
    //       idType: receivedNotification.id ?? 0,
    //       type: receivedNotification.channelKey ?? ''));
  }

  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
    BuildContext context,
    ReceivedAction receivedAction,
  ) async {
    logI(
        '.AppNotification, onActionReceivedMethod channelKey = ${receivedAction.channelKey}');
    // Your code goes here
    // Navigate into pages, avoiding to open the notification details page over another details page already opened

    if (receivedAction.channelKey == 'vehicle_reservation') {
      context.go(NamedRoutes.detailVehicleRes, extra: receivedAction.id);
    } else if (receivedAction.channelKey == 'room_reservation') {
      context.go(NamedRoutes.detailRoom, extra: receivedAction.id);
    }
  }
}
