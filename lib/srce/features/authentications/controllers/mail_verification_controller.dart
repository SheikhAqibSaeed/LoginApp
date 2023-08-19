import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/srce/constants/text_strings.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class MailVerificationController extends GetxController{
  @override
  void onInit(){
    super.onInit();
    sendVerificationEmail();
  }

  // Send or Resend Verification Email
  void sendVerificationEmail() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Helpler.errorSnackBar(title: tOnSnap, message: e.toString());
    }
  }

  // Set Timer to Check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {}

  // Manually Check if Varification Completed then Redirect
  void manuallyCheckEmailVerificationStatus() {}
}