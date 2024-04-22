import 'package:flutter/material.dart';
import 'package:selectable/selectable.dart';
import 'package:sizer/sizer.dart';

import '../../../../viewmodel/screens/dashboard_viewmodel.dart';
import '../../show_image_screen.dart';

Widget showData(DashboardViewModel viewModel) {
  return Container(
      width: 90.w,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.9),
      ),
      child: Selectable(child: Text(viewModel.resultText)));
}

Row showImage(BuildContext context, DashboardViewModel viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Hero(
        tag: "imageHero",
        child: GestureDetector(
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowImageScreen(
                        imageUrl: viewModel.loadedImage!.path)));
          },
          child: Container(
              margin: const EdgeInsets.all(20),
              width: 90.w,
              height: 250,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 1))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: FileImage(viewModel.loadedImage!),
                      fit: BoxFit.cover))),
        ),
      ),
    ],
  );
}
