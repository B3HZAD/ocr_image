import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final BaseViewModel viewModel;
  final Widget Function(T viewModel) builder;

  const ViewModelProvider(
      {super.key, required this.viewModel, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => viewModel as T,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget? child) =>
            builder(value),
      ),
    );
  }
}
