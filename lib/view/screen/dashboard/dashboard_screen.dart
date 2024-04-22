import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/buttons.dart';
import '../../../viewmodel/screens/dashboard_viewmodel.dart';
import '../../../viewmodel/view_model_provider.dart';
import 'widgets/dashboard_widgets.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/DashboardScreen";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap  again to exit app'),
      ),
      child: ViewModelProvider(
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
              // Show Selected Image
              viewModel.loadedImage == null
                  ? Container()
                  : showImage(context, viewModel),
              // Show Detected Text
              Expanded(
                child: viewModel.loading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.resultText.isEmpty
                        ? const SizedBox.shrink()
                        : SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Center(
                              child: showData(viewModel),
                            ),
                          ),
              )
            ],
          ));
        },
      ),
    ));
  }
}
