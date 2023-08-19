import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/srce/constants/colors.dart';
import 'package:login_app/srce/constants/image_string.dart';
import 'package:login_app/srce/constants/size.dart';
import 'package:login_app/srce/constants/text_strings.dart';
import 'package:login_app/srce/features/authentications/screens/signup/signup_screen.dart';

import '../../../../comman_widget/fade_in_animation/animation_design.dart';
import '../../../../comman_widget/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../comman_widget/fade_in_animation/fade_in_animation_model.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
 const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(bottomAfter: 0, bottomBefore: -100,
            leftBefore: 0,
            leftAfter: 0,
            topAfter: 0,
            topBefore: 0,
            rightAfter: 0,
            rightBefore: 0),
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'welcome-image-tag',
                    child: Image(
                      image: AssetImage(tWelcomeScreenImage),
                    height: height * 0.6,)
                  ),
                  Column(
                    children: [
                      Text(
                        tWelcomeTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        tWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () => Get.to (() => const LoginScreen()) ,
                              child: Text(tLogin.toUpperCase()))),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () => Get.to (() => const SignUpScreen()),
                              child: Text(tSignup.toUpperCase()))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
