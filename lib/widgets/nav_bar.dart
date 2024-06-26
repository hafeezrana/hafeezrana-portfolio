import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:portfolio/widgets/nav_bar_button.dart';
import 'package:portfolio/widgets/nav_bar_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;
  // final GlobalKey projectKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;
  NavBar(
      {required this.width,
      required this.intrestsKey,
      required this.skillsKey,
      // required this.projectKey,
      required this.scrollController,
      Key? key})
      : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    scrollController.animateTo(y,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
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
              onTap: () {},
            ),
            NavBarItem(
              text: 'Skills',
              onTap: () => scrollToWidgetByKey(skillsKey),
            ),
            NavBarItem(
              text: 'Education',
              onTap: () {},
              // onTap: () => scrollToWidgetByKey(intrestsKey),
            ),
            NavBarItem(
              text: 'Projects',
              // onTap: () {},
              onTap: () => scrollToWidgetByKey(intrestsKey),
              //  => scrollToWidgetByKey(projectKey),
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
          text: 'Interests',
          onTap: () {
            scrollToWidgetByKey(intrestsKey);
            collapsableHeight.value = 0.0;
          }),
      NavBarItem(
          text: 'github',
          onTap: () async {
            await launch('https://github.com/hafeezrana');
          }),
      NavBarItem(
          text: 'facebook',
          onTap: () async => await launch(
              'https://www.facebook.com/profile.php?id=100059808176019')),
      NavBarItem(
          text: 'linkedIn',
          onTap: () async =>
              await launch('https://www.linkedin.com/in/hafeez-rana/')),
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
            collapsableHeight),
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
                        )),
                    NavBarButton(
                        onPressed: () {
                          if (collapsableHeight.value == 0.0) {
                            collapsableHeight.value = 240.0;
                          } else if (collapsableHeight.value == 240.0) {
                            collapsableHeight.value = 0.0;
                          }
                        },
                        width: width),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}
