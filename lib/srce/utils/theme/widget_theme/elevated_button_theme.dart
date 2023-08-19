import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';

  // Light & Dark Elevated Button Theme
class TElevatedButtonTheme {

  TElevatedButtonTheme._(); // To avoid Creating Instance

// Light Theme
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(),
    foregroundColor: tWhiteColor,
    backgroundColor: tSecondaryColor,
    side: BorderSide(color: tSecondaryColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHeight.toDouble()),
  ),
);
// Dark Theme
static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: RoundedRectangleBorder(),
    foregroundColor: tSecondaryColor,
    backgroundColor: tWhiteColor,
    side: BorderSide(color: tSecondaryColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHeight.toDouble()),
  ),
);

}