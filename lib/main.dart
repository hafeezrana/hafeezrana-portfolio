import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/nav/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColors.primary,
    statusBarColor: CustomColors.primary,
  ));
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: CustomColors.primary,
      splashColor: CustomColors.primary,
      highlightColor: CustomColors.primary,
    ),
    title: 'hafeezrana',
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
