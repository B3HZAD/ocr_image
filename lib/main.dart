import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(const MyApp());
}
