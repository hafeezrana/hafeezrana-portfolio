import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/logo.dart';

import 'nav_bar_item_with_icon.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width, required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkBackground,
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(
            width: width,
            scrollController: scrollController,
          ),
          const SizedBox(height: 22),
          width > Breakpoints.sm
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Copyright © 2021 khalid-alsaleh-dev',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                    Text('All rights reserved',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                    Text('khalidlionel.2089@gmail.com',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                  ],
                )
              : Column(
                  children: [
                    Text('Copyright © 2021 khalid-alsaleh-dev',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                    const SizedBox(height: 10),
                    Text(' All rights reserved',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                    const SizedBox(height: 10),
                    Text('khalidlionel.2089@gmail.com',
                        style: GoogleFonts.getFont('Delius',
                            color: CustomColors.gray, fontSize: 14)),
                  ],
                ),
          SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  NavBarItemWithIcon(
                    text: 'github',
                    icon: ImageAssetConstants.github,
                    url: 'https://github.com/khalid-alsaleh-dev',
                  ),
                  SizedBox(width: 10),
                  NavBarItemWithIcon(
                      text: 'facebook',
                      icon: ImageAssetConstants.facebook,
                      url: 'https://www.facebook.com/khalid.alsaleh.52090/'),
                  SizedBox(width: 10),
                  NavBarItemWithIcon(
                      text: 'linkedIn',
                      icon: ImageAssetConstants.linkedIn,
                      url:
                          'https://www.linkedin.com/in/khalid-al-saleh-3561881a8/'),
                  SizedBox(width: 50),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
