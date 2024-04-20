import 'package:flutter/material.dart';
import 'package:scanImage/app/my_app.dart';
import 'package:scanImage/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(const MyApp());
}
