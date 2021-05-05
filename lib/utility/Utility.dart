// this method is used to close only the bottom sheet
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

closeBottomSheet(BuildContext context) {
  Navigator.pop(context);
}

Future<File> cameraOrGallery(bool camera) async {
  final picker = ImagePicker();
  File image;
  var source;
  if (camera) {
    source = ImageSource.camera;
  } else {
    source = ImageSource.gallery;
  }

  final pickedFile = await picker.getImage(source: source, imageQuality: 50);
  if (pickedFile != null) {
    image = File(pickedFile.path);
  }

  return image;
}
