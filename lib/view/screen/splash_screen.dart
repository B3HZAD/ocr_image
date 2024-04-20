import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scanImage/common/resources/color_manager.dart';
import 'package:scanImage/common/resources/values_manager.dart';
import 'package:scanImage/view/screen/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    Future.delayed(const Duration(seconds: AppDuration.d1), () async {
      _goNext();
    });
  }

  _goNext() async {
    Navigator.pushNamedAndRemoveUntil(
        context, DashboardScreen.routeName, (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        // color: ColorManager.primary,
        decoration: const BoxDecoration(color: ColorManager.kCyan900),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Test Project",
                    style: TextStyle(color: ColorManager.white, fontSize: 32),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
