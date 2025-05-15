import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uber_eats_restaurant/controller/services/images_services/images_services.dart';

class RestaurantRegisterProvider extends ChangeNotifier {
  List<File> restaurantBannerImages = [];
  List<String> restaurantBannerImagesURL = [];

  getRestaurantBannerImages(BuildContext context) async {
    restaurantBannerImages =
        await ImageServices.getImagesFromGallery(context: context);
    notifyListeners();
  }

  updateRestaurantBannerImages(BuildContext context) async {
    restaurantBannerImagesURL = await ImageServices.uploadImagesToDB(
        images: restaurantBannerImages, context: context);
    notifyListeners();
  }
}
