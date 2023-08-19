import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_app/srce/constants/colors.dart';
import 'package:login_app/srce/constants/image_string.dart';
import 'package:login_app/srce/constants/size.dart';
import 'package:login_app/srce/constants/text_strings.dart';
import 'package:login_app/srce/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/on_boarding_controller.dart';
import '../../models/model_on_boarding.dart';
import 'on_boarding_page_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
  final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            enableSideReveal: true,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),

          ),
          Positioned(
              bottom: 60 ,
              child: OutlinedButton(
                onPressed: () => obcontroller.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tDarkColor, shape: BoxShape.circle
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => obcontroller.skip(),
                child: Text("Skip", style: TextStyle(color: Colors.grey),),
              ),
          ),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                count:3,
                activeIndex: obcontroller.currentPage.value,
                effect: WormEffect(
                  activeDotColor: Color(0x272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


