import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:uber_eats_restaurant/constant/colors.dart';
import 'package:uber_eats_restaurant/constant/text_style.dart';

import '../widgets/text_field_widget.dart';

class AddFoodItemScreen extends StatefulWidget {
  const AddFoodItemScreen({super.key});

  @override
  State<AddFoodItemScreen> createState() => _AddFoodItemScreenState();
}

class _AddFoodItemScreenState extends State<AddFoodItemScreen> {
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController restaurantLicenseNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(
            height: 2.h,
          ),
          Container(
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
