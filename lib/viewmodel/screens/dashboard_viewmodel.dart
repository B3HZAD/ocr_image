import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scanImage/service/service_locator.dart';
import 'package:scanImage/tools/text_recognizer.dart';
import 'package:scanImage/viewmodel/base_view_model.dart';
import '../../service/media_service.dart';

class DashboardViewModel extends BaseViewModel {
  BuildContext context;

  DashboardViewModel({required this.context}) : super(context: context);

  final mediaService = locator.get<MediaService>();
  File? image;
  String resultText = "";
  bool loading = false;
  final MLKitTextRecognizer _recognizer = MLKitTextRecognizer();

  init() {}

  Future<void> getImage({bool gallery = false}) async {
    image = await mediaService.getImage(fromGallery: gallery);
    if (image != null) {
      await readTextFromImage(image!.path);
    }
  }

  readTextFromImage(String path) async {
    List<String> recognizedText = [];
    loading = true;
    resultText = "";
    notifyListeners();
    try {
      recognizedText = await _recognizer.processImage(path);
    } catch (e) {
      recognizedText = [];
    }

    for (var element in recognizedText) {
      resultText += "$element\n";
    }

    loading = false;
    notifyListeners();
  }
}
