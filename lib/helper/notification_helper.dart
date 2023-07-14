import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/controllers/auth_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationHelper{

  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async {
    var androidInitialize = const AndroidInitializationSettings('notification_icon');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings, onSelectNotification: (String? payload){
      try{
        if(payload != null && payload.isNotEmpty) {}else {

          // Get.toNamed(RouteHelper.getNotificationRoute());
        }
      }catch (e){
        if(kDebugMode) {
          print(e.toString());
        }
      }
      return;
    });
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(".............onMessage...........");
      print("onBackground: ${message.notification?.title}"
          "/${message.notification?.body}"
          "/${message.notification?.titleLocKey}");

      NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin);
      if(Get.find<AuthController>().userLoggedIn()) {

        // Get.find<OrderController>().getRunningOrders(1);
        // Get.find<OrderController>().getHistoryOrders(1);
        // Get.find<OrderController>().getNotificationList(true);

      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      print("onBackground: ${message.notification?.title}"
          "/${message.notification?.body}"
          "/${message.notification?.titleLocKey}");
      try{
        if(message.notification?.titleLocKey != null) {
          // Get.toNamed(RouteHelper.getOrderDetailRoute(int.parse(message.notification!.titleLocKey!)));
        } else{

          // Get.toNamed(RouteHelper.getNotificationRoute());
        }
      }catch (e){

        print(e.toString());
      }
    });
  }

  static Future<void> showNotification(RemoteMessage msg,
      FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      msg.notification!.body!, htmlFormatBigText: true,
      contentTitle: msg.notification!.title!, htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id_1', 'dbfood', importance: Importance.high,
      styleInformation: bigTextStyleInformation, priority: Priority.high,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics,
    iOS: const IOSNotificationDetails(),
    );
    await fln.show(0, msg.notification!.title!, msg.notification!.body!, platformChannelSpecifics,);
  }
}