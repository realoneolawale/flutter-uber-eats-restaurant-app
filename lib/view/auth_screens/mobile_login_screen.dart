import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/text_style.dart';
import '../../controller/provider/auth_provider/auth_provider.dart';
import '../../controller/services/authServices/mobile_auth_services.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  String selectedCountry = '+91';
  TextEditingController mobileController = TextEditingController();
  bool receivedOtpButtonPressed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        receivedOtpButtonPressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Enter your mobile number',
              style: AppTextStyles.body16,
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountry = '+${country.phoneCode}';
                          });
                        });
                  },
                  child: Container(
                    height: 6.h,
                    width: 25.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      //color: greyShade3,
                      border: Border.all(color: grey),
                    ),
                    child: Text(
                      selectedCountry,
                      style: AppTextStyles.body14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 65.w,
                  child: TextField(
                    controller: mobileController,
                    cursorColor: black,
                    style: AppTextStyles.textFieldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                      hintText: 'Mobile number',
                      //filled: true,
                      //fillColor: greyShade3,
                      hintStyle: AppTextStyles.textFieldHintTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: black, minimumSize: Size(90.w, 6.h)),
              onPressed: () {
                setState(() {
                  receivedOtpButtonPressed = true;
                });
                context.read<MobileAuthProvider>().updateMobileNumber(
                    '$selectedCountry${mobileController.text.trim()}');
                MobileAuthServices().receiveOTP(
                    context: context,
                    mobileNumber:
                        '$selectedCountry${mobileController.text.trim()}');
              },
              child: receivedOtpButtonPressed
                  ? CircularProgressIndicator(
                      color: white,
                    )
                  : Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Next",
                            style: AppTextStyles.body16.copyWith(color: white),
                          ),
                        ),
                        Positioned(
                          right: 2.w,
                          child: Icon(
                            Icons.arrow_forward,
                            color: white,
                          ),
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: 3.w,
            ),
            Text(
              'By proceeding, you consent to get calls, WhatsApp or SMS messages, including by Uber, from Uber and its affiliates to the number provided.',
              style: AppTextStyles.small12.copyWith(color: grey),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    'or',
                    style: AppTextStyles.small12.copyWith(color: grey),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                minimumSize: Size(90.w, 6.h),
                elevation: 2,
              ),
              onPressed: () {},
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Google",
                      style: AppTextStyles.body16,
                    ),
                  ),
                  Positioned(
                    left: 2.w,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: black,
                      size: 3.h,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
