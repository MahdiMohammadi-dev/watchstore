import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropperPicker {
  File? _image;

  Future<void> pickAndCropImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await croppedImage(imageFile: img);
      _image = img;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<File?> croppedImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);

    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  File? get getImage => _image;
}
