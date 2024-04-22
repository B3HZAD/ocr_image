import 'dart:io';
import 'package:flutter/material.dart';
import '../../model/image_data_model.dart';
import '../../service/app_text_recognizer.dart';
import '../../service/media_service.dart';
import '../../service/service_locator.dart';
import '../base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  BuildContext context;

  DashboardViewModel({required this.context}) : super(context: context);

  final mediaService = locator.get<MediaService>();
  File? image;
  File? loadedImage;
  String resultText = "";
  bool loading = false;

  final AppTextRecognizer _recognizer = AppTextRecognizer();

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  Future<void> getImage({bool gallery = false}) async {
    image = await mediaService.getImage(fromGallery: gallery);
    if (image != null) {
      await readTextFromImage(image!.path);
    }
  }

  readTextFromImage(String path) async {
    loading = true;
    resultText = "";
    loadedImage = null;
    notifyListeners();

    List<String> recognizedText = [];
    ImageDataModel imageData = ImageDataModel();

    ImageDataModel? temp = await _recognizer.processImage(path);
    imageData.lines = temp!.lines;
    imageData.imagePath = temp.imagePath;

    recognizedText = imageData.lines!;
    loadedImage = File(image!.path);

    for (var element in recognizedText) {
      resultText += "$element\n";
    }
    loading = false;
    notifyListeners();
  }
}
