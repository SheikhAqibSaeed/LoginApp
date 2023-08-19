import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentications/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.offAll(() => const WelcomeScreen());
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welco));

  }
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welco));

  }
}