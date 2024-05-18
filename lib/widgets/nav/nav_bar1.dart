// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:portfolio/widgets/nav_bar_button.dart';
import 'package:portfolio/widgets/nav_bar_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar1 extends StatelessWidget {
  final double width;
  final GlobalKey homeKey;
  final GlobalKey skillsKey;
  final GlobalKey educationKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;

  NavBar1({
    required this.width,
    required this.homeKey,
    required this.skillsKey,
    required this.educationKey,
    required this.experienceKey,
    required this.projectsKey,
    required this.scrollController,
    Key? key,
  }) : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero, ancestor: null);
      final offset = scrollController.offset + position.dy;
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget navBarRow = Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: Logo(
            width: width,
            scrollController: scrollController,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBarItem(
              text: 'Home',
              onTap: () => scrollToWidgetByKey(homeKey),
            ),
            NavBarItem(
              text: 'Skills',
              onTap: () => scrollToWidgetByKey(skillsKey),
            ),
            NavBarItem(
              text: 'Education',
              onTap: () => scrollToWidgetByKey(educationKey),
            ),
            NavBarItem(
              text: 'Experience',
              onTap: () => scrollToWidgetByKey(experienceKey),
            ),
            NavBarItem(
              text: 'Projects',
              onTap: () => scrollToWidgetByKey(projectsKey),
            ),
            const SizedBox(width: 60),
          ],
        ),
      ],
    );

    List<Widget>? navBarColumn = [
      NavBarItem(
        text: 'Home',
        onTap: () {
          scrollToWidgetByKey(homeKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: 'Skills',
        onTap: () {
          scrollToWidgetByKey(skillsKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: 'Education',
        onTap: () {
          scrollToWidgetByKey(educationKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: 'Experience',
        onTap: () {
          scrollToWidgetByKey(experienceKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: 'Projects',
        onTap: () {
          scrollToWidgetByKey(projectsKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: 'GitHub',
        onTap: () async {
          await launch('https://github.com/hafeezrana');
        },
      ),
      NavBarItem(
        text: 'Facebook',
        onTap: () async {
          await launch(
              'https://www.facebook.com/profile.php?id=100059808176019');
        },
      ),
      NavBarItem(
        text: 'LinkedIn',
        onTap: () async {
          await launch('https://www.linkedin.com/in/hafeez-rana/');
        },
      ),
    ];

    return Stack(
      children: [
        ObxValue<RxDouble>(
          (data) => AnimatedContainer(
            margin: const EdgeInsets.only(top: 110.0),
            duration: const Duration(milliseconds: 375),
            curve: Curves.ease,
            height: data.value,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CustomColors.darkBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: navBarColumn,
              ),
            ),
          ),
          collapsableHeight,
        ),
        Container(
          height: 80.0,
          margin: const EdgeInsets.only(top: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: (width < Breakpoints.xlg)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: Logo(
                        width: width,
                        scrollController: scrollController,
                      ),
                    ),
                    NavBarButton(
                      onPressed: () {
                        if (collapsableHeight.value == 0.0) {
                          collapsableHeight.value = 240.0;
                        } else if (collapsableHeight.value == 240.0) {
                          collapsableHeight.value = 0.0;
                        }
                      },
                      width: width,
                    ),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}

class MyTitleWidget extends StatelessWidget {
  final double width;
  final String title;

  const MyTitleWidget({
    Key? key,
    required this.width,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkBackground,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        left: width >= Breakpoints.lg ? width * 0.1 : width * 0.05,
      ),
      child: Text(
        title,
        style: GoogleFonts.getFont(
          'Delius',
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }
}
