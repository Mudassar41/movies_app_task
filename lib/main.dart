import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/base/app_data.dart';
import 'package:task/base/app_theme.dart';
import 'package:task/views/home_view.dart';

void main() async {
  await AppData.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: AppTheme.theme,
      home: const HomeView(),
    );
  }
}
