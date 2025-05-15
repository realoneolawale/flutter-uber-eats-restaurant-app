import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uber_eats_restaurant/controller/provider/restaurant_register_provider/restaurant_register_provider.dart';

import '../../constant/colors.dart';
import '../../constant/text_style.dart';
import '../widgets/text_field_widget.dart';

class RestaurantRegistrationScreen extends StatefulWidget {
  const RestaurantRegistrationScreen({super.key});

  @override
  State<RestaurantRegistrationScreen> createState() =>
      _RestaurantRegistrationScreenState();
}

class _RestaurantRegistrationScreenState
    extends State<RestaurantRegistrationScreen> {
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController restaurantLicenseNumberController =
      TextEditingController();
  CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(
            height: 2.h,
          ),
          Consumer<RestaurantRegisterProvider>(
              builder: (context, registrationProvider, child) {
            if (registrationProvider.restaurantBannerImages.isEmpty) {
              return InkWell(
                onTap: () async {
                  await registrationProvider.getRestaurantBannerImages(context);
                },
                child: Container(
                  height: 20.h,
                  width: 94.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: greyShade3,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        width: 5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: black),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          size: 3.h,
                          color: black,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Add',
                        style: AppTextStyles.body14,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              List<File> bannerImages =
                  registrationProvider.restaurantBannerImages;
              return Container(
                height: 23.h,
                width: 94.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  border: Border.all(color: greyShade3),
                ),
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    height: 23.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                  items: bannerImages
                      .map(
                        (image) => Container(
                          width: 94.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }
          }),
          SizedBox(
            height: 4.h,
          ),
          CommonTextField(
            controller: restaurantNameController,
            title: 'Name',
            hintText: 'Restaurant name',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 2.h,
          ),
          CommonTextField(
            controller: restaurantLicenseNumberController,
            title: 'License number',
            hintText: 'License number',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
