import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massguard/internet_controller.dart';
import 'package:massguard/no_internet_screen.dart';

void main() {
  Get.put(InternetController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NoInternet(),
    );
  }
}
