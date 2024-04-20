import 'package:flutter/material.dart';
import 'package:scanImage/view/screen/dashboard_screen.dart';
import 'package:scanImage/view/screen/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(dynamic context)> routes = {
    '/': (context) => const SplashScreen(),
    DashboardScreen.routeName: (context) => const DashboardScreen(),
  };
}
