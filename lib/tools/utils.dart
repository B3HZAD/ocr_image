import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<InputImage?> preProcessImage(String imagePath) async {
    File imageFile = File(imagePath);
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

    if (image == null) {
      return null;
    }
    // Resize the image
    img.Image resizedImage = img.copyResize(image, width: 800);

    // Apply  file
    File resizedImageFile = File(imagePath)
      ..writeAsBytesSync(img.encodeJpg(resizedImage));

    // Remove noise
    final noiseRemovedImage = clearNoise(resizedImageFile);

    // Adjust brightness and contrast
    // Adjust color parameters
    double brightness = 255;
    double contrast = 1.0;
    double saturation = 1.0;
    double hue = 0.2;
    img.Image contrastAdjustedImage = adjustBrAndCont(noiseRemovedImage,
        brightness: brightness,
        contrast: contrast,
        saturation: saturation,
        hue: hue);

    //Save in temp
    createFinalFile(image: contrastAdjustedImage);

    String finalImage = await createFinalFile(image: contrastAdjustedImage);
    // Create an InputImage object
    InputImage inputImage = InputImage.fromFilePath(finalImage);

    return inputImage;
  }

  static img.Image clearNoise(File image) {
    img.Image? tempImage = img.decodeImage(image.readAsBytesSync());
    return img.gaussianBlur(tempImage!, 0);
  }

  static img.Image adjustBrAndCont(img.Image image,
      {double brightness = 255,
      double contrast = 1.0,
      double saturation = 1.0,
      double hue = 0.1}) {
    return img.adjustColor(image,
        brightness: brightness,
        contrast: contrast,
        saturation: saturation,
        hue: hue);
  }

  static Future<String> createFinalFile({required img.Image image}) async {
    Directory tempPath = await getTemporaryDirectory();
    String finalImage = "${tempPath.path}/${DateTime.now()}.jpg";
    File(finalImage).writeAsBytesSync(img.encodeJpg(image));
    return finalImage;
  }
}
