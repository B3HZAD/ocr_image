import 'package:google_ml_kit/google_ml_kit.dart';


class MLKitTextRecognizer  {
  late TextRecognizer recognizer;

  MLKitTextRecognizer() {
    recognizer = TextRecognizer();
  }

  void dispose() {
    recognizer.close();
  }


  Future<List<String>> processImage(String imgPath) async {
    final inputImage = InputImage.fromFilePath(imgPath);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);

    List<String> extractedLines = [];

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        extractedLines.add(line.text); // Add each line to the list
      }
    }
    return extractedLines;
  }
}
