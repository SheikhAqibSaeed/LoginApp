import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_app/srce/constants/text_strings.dart';
import 'package:login_app/srce/features/authentications/models/user_model.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../repository/authentication_repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();


  // Repository
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Step 3 - Get User Email and pass to user Repository to fatch user record

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email!= null){
      return _userRepo.getUserDetails(email);
    }else {
      Get.snackbar("Login", "Login to continue");
    }
  }

  // Fetch list of users record
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers(tFullName);

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
