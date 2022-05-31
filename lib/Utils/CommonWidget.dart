import 'dart:io';

import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

File imagePath = File("");
List<AssetEntity>? image;

snackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}

void onLoading(BuildContext context, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(loader, height: 35, width: 35)),
      );
    },
  );
}

Future _getFile(ImageSource source) async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: source,
  );
  print("Image Path " + pickedFile!.path);

  if (pickedFile != null) {
    return imagePath = File(pickedFile.path);
  } else {
    return "";
  }
}

Future showImagePicker(context) {
  // imagePath = null;
  Future<void> future = showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _getFile(ImageSource.gallery)
                        .then((value) => Navigator.of(context).pop());
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _getFile(ImageSource.camera)
                      .then((value) => Navigator.of(context).pop());
                },
              ),
            ],
          ),
        ),
      );
    },
  );
  return future;
}
