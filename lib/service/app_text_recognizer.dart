import 'package:google_ml_kit/google_ml_kit.dart';

import '../model/image_data_model.dart';
import '../tools/utils.dart';

class AppTextRecognizer {
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  void dispose() {
    textRecognizer.close();
  }

  Future<ImageDataModel?> processImage(String imgPath) async {
    if (imgPath.isEmpty) return null;
    ImageDataModel? imageData = ImageDataModel();
    InputImage? inputImage = await Utils.preProcessImage(imgPath);

    RecognizedText recognisedText =
        await textRecognizer.processImage(inputImage!);

    List<String> extractedLines = [];

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        extractedLines.add(line.text);
      }
    }

    imageData =
        ImageDataModel(lines: extractedLines, imagePath: inputImage.filePath!);
    return imageData;
  }
}
