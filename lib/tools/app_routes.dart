import 'package:flutter/material.dart';

import '../view/screen/dashboard/dashboard_screen.dart';
import '../view/screen/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(dynamic context)> routes = {
    '/': (context) => const SplashScreen(),
    DashboardScreen.routeName: (context) => const DashboardScreen(),
  };
}
