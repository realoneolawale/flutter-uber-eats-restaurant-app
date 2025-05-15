import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../dto/auth_response_dto.dart';
import '../../../view/auth_screens/mobile_login_screen.dart';
import '../../../view/auth_screens/otp_screen.dart';
import '../../../view/sign_in_logic_screen/sign_in_logic_screen.dart';
import '../../provider/auth_provider/auth_provider.dart';

const String baseUrl = 'http://10.0.2.2:40160/'; // android emulator
const String userUrl = '${baseUrl}api/User';

class MobileAuthServices {
  late final String url;

  static checkRestaurantRegistration({required BuildContext context}) {
    bool restaurantIsRegistered = false;
    try {
      /* await fireStore.collection('Restaurant').where('restaurantUID', is equalTo: auth.currentUser!.uid).get().then((value) => {
        value.size > 0 ? restaurantIsRegistered = true : restaurantIsRegistered = false;
      });
      if(restaurantIsRegistered){
        Navigator.pushAndRemoveUntil(context, PageTransition(child: const BottomNavigationBarUberEats(), type: PageTransitionType.rightToLeft), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, PageTransition(child: const RestaurantRegistrationScreen(), type: PageTransitionType.rightToLeft), (route) => false);
      }

       */
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // check if the user is authenticated - return the home screen or auth screen
  bool checkAuthentication(BuildContext context) {
    String? verificationId = context.read<MobileAuthProvider>().verificationID;
    if (verificationId == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileLoginScreen()),
          (route) => false);
      return false;
    }
    // redirect to RestaurantRegistrationScreen or Home
    checkAuthentication(context);
    return true;
  }

  void receiveOTP(
      {required BuildContext context, required String mobileNumber}) async {
    try {
      dynamic response = await loginUser(mobileNumber);
      if (response == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid login')));
      } else {
        context
            .read<MobileAuthProvider>()
            .updateVerificationId(response!.userId.toString());
        Navigator.push(
            context,
            PageTransition(
                child: const OTPScreen(),
                type: PageTransitionType.rightToLeft));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required int userId,
      required String otp}) async {
    try {
      var response = await verifyLoggedInUserOTP(userId, otp);
      if (response == true) {
        Navigator.push(
            context,
            PageTransition(
                child: SignInLogicScreen(),
                type: PageTransitionType.rightToLeft));
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  //////////////////////////////////// Network methods ///////////////////////////////////////////////
  Future<dynamic> loginUser(String phoneNumber) async {
    // add the headers
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    // add the body
    final body =
        jsonEncode({'email': '', 'password': '', 'phoneNumber': phoneNumber});
    url = '${userUrl}/login';
    log("URL: " + url);
    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        Map<String, dynamic> authResponseMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        AuthResponseDto responseDto = AuthResponseDto.fromJson(authResponseMap);
        return responseDto;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future verifyLoggedInUserOTP(int userId, String otp) async {
    url = '${userUrl}/verify-otp/${userId}/${otp}';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
