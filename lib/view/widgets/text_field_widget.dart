import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uber_eats_restaurant/constant/text_style.dart';

import '../../constant/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      required this.keyboardType});
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.body16Bold,
        ),
        SizedBox(
          height: 0.8.h,
        ),
        TextField(
          controller: controller,
          cursorColor: black,
          style: AppTextStyles.textFieldTextStyle,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
            hintText: hintText,
            hintStyle: AppTextStyles.textFieldHintTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: black),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: green200),
            ),
          ),
        ),
      ],
    );
  }
}
