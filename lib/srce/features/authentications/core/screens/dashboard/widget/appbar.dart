import 'package:flutter/material.dart';
import 'package:login_app/srce/repository/authentication_repository/authentication_repository.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/image_string.dart';
import '../../../../../../constants/text_strings.dart';
import '../profile/profile_screen.dart';
import '../profile/profile_screen.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  //get isDark => null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.menu, color: Colors.black,
        //For Dark Color
        //color: isDark ? tWhiteColor : tDarkColor,
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headlineSmall),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //For Dark Color
            //color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          child: IconButton(onPressed: () {
            AuthenticationRepository.instance.logout();
            // AuthenticationRepository.ProfileScreen;
          }, icon: const Image(image: AssetImage(tUserProfileImage))),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
