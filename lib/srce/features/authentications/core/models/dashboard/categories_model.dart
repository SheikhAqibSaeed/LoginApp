import 'package:flutter/material.dart';

class DashboardCategoriesModel{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("JS", "JavaScript", "10 Lessons", null),
    DashboardCategoriesModel("F", "Flutter", "11 Lessons", null),
    DashboardCategoriesModel("H", "HTML", "14 Lessons", null),
    DashboardCategoriesModel("K", "Kotlin", "8 Lessons", null),
    DashboardCategoriesModel("P", "Python", "3 Lessons", null),

  ];

}