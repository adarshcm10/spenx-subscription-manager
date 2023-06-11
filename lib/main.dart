import 'package:flutter/material.dart';
import 'package:spenx/getstarted.dart';
import 'package:spenx/services/notif_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff080808),
      ),
      home: const getstarted(),
    );
  }
}
