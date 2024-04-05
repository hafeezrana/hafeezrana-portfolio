import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class HelloWithBio extends StatelessWidget {
  final double width;
  final double ratio;
  const HelloWithBio({required this.width, required this.ratio, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello!  I’m Hafeez Rana',
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white, fontSize: 26)),
          const SizedBox(height: 5),
          Text(
            'I am looking for challenging tasks to solve them softly',
            style: GoogleFonts.getFont('Delius',
                color: CustomColors.gray, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
