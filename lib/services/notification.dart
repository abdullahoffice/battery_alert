// import 'package:batteryanimation/services/background_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/launcher_icon');

  void initialiseNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);

    await _notificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: stopNotification,
      // onDidReceiveBackgroundNotificationResponse: stopNotification
    );
  }

  ///send simple notifications
  Future<void> sendNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.high,
            playSound: true,
            priority: Priority.high);
    NotificationDetails notificationDetails =
        const NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }

  ///send notification after interval
  void scheduleNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.high,
      playSound: true,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails =
        const NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  ///stop notification

  void cancelNotifi(int id) async {
    await _notificationsPlugin.cancel(id);
  }
}
