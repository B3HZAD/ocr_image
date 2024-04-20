import 'package:flutter/material.dart';
import 'package:scanImage/common/widgets/buttons.dart';
import 'package:scanImage/viewmodel/screens/dashboard_viewmodel.dart';
import 'package:scanImage/viewmodel/view_model_provider.dart';
import 'package:selectable/selectable.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/DashboardScreen";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelProvider(
      viewModel: DashboardViewModel(context: context),
      builder: (DashboardViewModel viewModel) {
        return SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton(Icons.image, action: () async {
                  viewModel.getImage(gallery: true);
                }),
                actionButton(Icons.camera, action: () async {
                  viewModel.getImage();
                }),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    margin: EdgeInsets.all(5.h),
                    child: viewModel.loading
                        ? const CircularProgressIndicator.adaptive()
                        : Selectable(child: Text(viewModel.resultText))),
              ),
            )
          ],
        ));
      },
    ));
  }
}
