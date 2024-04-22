import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/color_manager.dart';

Widget actionButton(IconData icon, {required Future<void> Function() action}) {
  return GestureDetector(
    onTap: action,
    child: Container(
      margin: const EdgeInsets.only(left: 10, top: 22),
      padding: EdgeInsets.all(2.w),
      width: 15.h,
      height: 5.h,
      decoration: BoxDecoration(
          color: ColorManager.kMainBgColor,
          borderRadius: BorderRadius.circular(40.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(1, 1),
            ),
          ]),
      child: Icon(icon),
    ),
  );
}
