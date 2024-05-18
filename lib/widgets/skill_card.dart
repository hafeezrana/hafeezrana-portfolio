import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:readmore/readmore.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  final double ratio;
  final String icon;
  const SkillCard(
      {required this.title,
      required this.description,
      required this.icon,
      required this.width,
      required this.ratio,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.brightBackground,
      child: SizedBox(
        width: width * ratio,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.primary, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Freelancing",
                      style: GoogleFonts.getFont('Delius',
                          color: Colors.white, fontSize: 15)),
                  const SizedBox(height: 10),
                  Text(description,
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray, fontSize: 12)),
                ],
              ),
            ),
            width >= Breakpoints.md
                ? Positioned(
                    child: Image.asset(icon),
                    top: 20,
                    right: 20,
                    width: 20,
                    height: 18)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  final double ratio;
  final String icon;
  final String compnyName;
  final String duration;
  const ExperienceCard(
      {required this.title,
      required this.description,
      required this.icon,
      required this.width,
      required this.ratio,
      required this.compnyName,
      required this.duration,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.brightBackground,
      child: SizedBox(
        width: width * ratio,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.primary, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(compnyName,
                      style: GoogleFonts.getFont('Delius',
                          color: Colors.lightBlue, fontSize: 15)),
                  const SizedBox(height: 5),
                  Text(duration,
                      style: GoogleFonts.getFont('Delius',
                          color: Colors.white, fontSize: 10)),
                  const SizedBox(height: 8),
                  Text(description,
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray, fontSize: 12)),
                ],
              ),
            ),
            width >= Breakpoints.md
                ? Positioned(
                    child: Image.asset(icon),
                    top: 20,
                    right: 20,
                    width: 40,
                    height: 48)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String projectImg;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.projectImg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Card(
        color: CustomColors.brightBackground,
        child: Container(
          width: 350, // Width of each item
          decoration: BoxDecoration(
            color: CustomColors.brightBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    projectImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Center(
                  child: Text(
                    title,
                    style: GoogleFonts.getFont('Delius',
                        color: CustomColors.primary, fontSize: 14),
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: ReadMoreText(description,
                    trimLines: 2,
                    textAlign: TextAlign.center,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    style: GoogleFonts.getFont('Delius',
                        color: CustomColors.gray, fontSize: 8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
