import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/constant.dart';

class ImageServices {
  static getImagesFromGallery({required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await picker.pickMultiImage(imageQuality: 100);
    List<XFile> filePick = pickedFile;
    if (filePick.isNotEmpty) {
      for (var image in filePick) {
        selectedImages.add(File(image.path));
      }
    } else {
      // show toast messages
    }
    log('The images ae \n ${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static uploadImagesToDB(
      {required List<File> images, required BuildContext context}) async {
    List<String> imagesURL = [];
    String sellerUID = auth.currentUser!.id;
    await Future.forEach(images, (image) => {
      String imageName = '$sellerUID${uuid.v1().toString()}';
      Reference ref = storage.ref().child('RestaurantBannerImages').child(imageName);
      await ref.putFile(File(image.path));
      String imageURL = await ref.getDownloadURL();
      imagesURL.add(imageURL);
    });
    return imagesURL;
  }
}
