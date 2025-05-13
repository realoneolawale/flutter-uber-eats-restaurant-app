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
  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodDescriptionController = TextEditingController();
  TextEditingController foodPriceController = TextEditingController();
  bool foodIsPureVegetarian = true;

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
            controller: foodNameController,
            title: 'Name',
            hintText: 'Food name',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 2.h,
          ),
          CommonTextField(
            controller: foodNameController,
            title: 'Description',
            hintText: 'Food description',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 2.h,
          ),
          CommonTextField(
            controller: foodNameController,
            title: 'Price',
            hintText: 'Food price',
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Food is Vegetarian',
            style: AppTextStyles.body16Bold,
          ),
          SizedBox(
            height: 0.8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    foodIsPureVegetarian = true;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 3.h,
                      width: 3.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: foodIsPureVegetarian
                            ? Colors.green.shade100
                            : transparent,
                        borderRadius: BorderRadius.circular(3.sp),
                        border: Border.all(
                            color: foodIsPureVegetarian ? black : grey),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.check,
                        size: 2.h,
                        color: foodIsPureVegetarian ? black : transparent,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Vegetarian',
                      style: AppTextStyles.body14,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    foodIsPureVegetarian = false;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 3.h,
                      width: 3.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: !foodIsPureVegetarian
                            ? Colors.red.shade100
                            : transparent,
                        borderRadius: BorderRadius.circular(3.sp),
                        border: Border.all(
                            color: !foodIsPureVegetarian ? black : grey),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.check,
                        size: 2.h,
                        color: !foodIsPureVegetarian ? black : transparent,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Non-Vegetarian',
                      style: AppTextStyles.body14,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
