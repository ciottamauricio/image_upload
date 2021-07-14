import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageItemController {
  Future<File> obterImagemCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      return await _cropImage(File(image.path));
    }

    return null;
  }

  Future<File> obterImagemGaleria() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      return await _cropImage(File(image.path));
    }

    return null;
  }
}

Future<File> _cropImage(File image) async {
  File croppedFile = await ImageCropper.cropImage(
    sourcePath: image.path,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
    androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Ajustar imagem',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.grey,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    iosUiSettings: IOSUiSettings(
      title: 'Ajustar imagem',
    ),
  );

  if (croppedFile != null) {
    image = croppedFile;

    return image;
  }
}
