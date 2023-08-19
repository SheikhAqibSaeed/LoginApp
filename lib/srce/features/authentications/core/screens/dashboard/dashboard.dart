import 'package:flutter/material.dart';
import 'package:login_app/srce/constants/colors.dart';
import 'package:login_app/srce/features/authentications/core/screens/dashboard/widget/appbar.dart';
import 'package:login_app/srce/features/authentications/core/screens/dashboard/widget/banners.dart';
import 'package:login_app/srce/features/authentications/core/screens/dashboard/widget/categories.dart';
import 'package:login_app/srce/features/authentications/core/screens/dashboard/widget/search.dart';
import 'package:login_app/srce/features/authentications/core/screens/dashboard/widget/top_courses.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import '../../models/dashboard/categories_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Variables
    final list = DashboardCategoriesModel.list;
    // bool isDark = tDarkColor as bool;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tDashboardTitle,
                style: txtTheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headlineMedium,
              ),
              const SizedBox(
                height: tDashboardPadding,
              ),

              //Search Box
              DashboardSearchBox(txtTheme: txtTheme),
              const SizedBox(height: tDashboardPadding),

              //Categories Box
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(height: tDashboardPadding),

              //Banners Box
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1st banner
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //For Dark Color
                        //color: isDark ? tSecondaryColor : tCardBgColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Flexible(
                                  child:
                                      Image(image: AssetImage(tBookmarkIcon))),
                              Flexible(
                                  child:
                                      Image(image: AssetImage(tBannerImage1))),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(tDashboardBannerTitle1,
                              style: txtTheme.headlineSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          Text(tDashboardBannerSubTitle,
                              style: txtTheme.bodyText2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: tDashboardCardPadding),
                  //2nd Banner
                  Expanded(
                    child: Column(
                      children: [
                        //Card
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //For Dark Color
                            // color: isDark ? tSecondaryColor : tCardBgColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Flexible(
                                      child: Image(
                                          image: AssetImage(tBookmarkIcon))),
                                  Flexible(
                                      child: Image(
                                          image: AssetImage(tBannerImage2))),
                                ],
                              ),
                              Text(tDashboardBannerTitle2,
                                  style: txtTheme.headlineSmall,
                                  overflow: TextOverflow.ellipsis),
                              Text(tDashboardBannerSubTitle,
                                  style: txtTheme.bodyText2,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(tDashboardButton)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // DashboardBanners(txtTheme: txtTheme),
              const SizedBox(height: tDashboardPadding),

              // Top Courses Box
              Text(tDashboardTopCourses,
                  style: txtTheme.headlineSmall?.apply(fontSizeFactor: 1.2)),
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tCardBgColor),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Flutter Crash Course',
                                        style: txtTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                      image: AssetImage(tTopCourseImage1),
                                      height: 110,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder()),
                                      onPressed: () {},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                    SizedBox(width: tDashboardCardPadding,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('3 Sections', style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                                        Text('Programing Languages', style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tCardBgColor),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Flutter Crash Course',
                                        style: txtTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                          image: AssetImage(tTopCourseImage1),
                                          height: 110,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder()),
                                      onPressed: () {},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                    SizedBox(width: tDashboardCardPadding,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('3 Sections', style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                                        Text('Programing Languages', style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tCardBgColor),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Flutter Crash Course',
                                        style: txtTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                          image: AssetImage(tTopCourseImage1),
                                          height: 110,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder()),
                                      onPressed: () {},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                    SizedBox(width: tDashboardCardPadding,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('3 Sections', style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                                        Text('Programing Languages', style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tCardBgColor),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Flutter Crash Course',
                                        style: txtTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                          image: AssetImage(tTopCourseImage1),
                                          height: 110,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder()),
                                      onPressed: () {},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                    SizedBox(width: tDashboardCardPadding,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('3 Sections', style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                                        Text('Programing Languages', style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tCardBgColor),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Flutter Crash Course',
                                        style: txtTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                          image: AssetImage(tTopCourseImage1),
                                          height: 110,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder()),
                                      onPressed: () {},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                    SizedBox(width: tDashboardCardPadding,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('3 Sections', style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                                        Text('Programing Languages', style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              // DashboardTopCourses(txtTheme: txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardTopCoursesModel {}
