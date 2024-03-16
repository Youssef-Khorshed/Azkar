import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar_application_/Core/BlocObserver/observer.dart';
import 'package:azkar_application_/app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Core/Notification Services/notification_services.dart';
import 'Core/DepndancyInjection/dependancy.dart' as db;

Future<void> main() async {
  intialization();
  runApp(AzkarApp());
}

Future<void> intialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Future.wait([
    db.init(),
    NotificationServices.initializeNotification(),
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    })
  ]);
}
