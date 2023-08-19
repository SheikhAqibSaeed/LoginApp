import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/srce/features/authentications/models/user_model.dart';
import 'package:login_app/srce/repository/authentication_repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextField
    final email = TextEditingController();
    final password = TextEditingController();
    final fullName = TextEditingController();
    final phoneNo = TextEditingController();

    final userRepo = Get.put(UserRepository());

  // Call this function from design & it will do the rest
  void registerUser(String email, String password){
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);

    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}