// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/hello_with_bio.dart';
import 'package:portfolio/widgets/info.dart';
import 'package:portfolio/widgets/skill_card.dart';

class SkillConatiner extends StatefulWidget {
  final double width;

  const SkillConatiner({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<SkillConatiner> createState() => _SkillConatinerState();
}

class _SkillConatinerState extends State<SkillConatiner> {
  // final GlobalKey projectKey;

  final bool _isExpanded = false;
  final List<bool> _isExpandedList = List.filled(projectList.length, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: CustomColors.darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: widget.width * 0.09),

          /// Skill card
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                          title: 'Flutter Development',
                          description:
                              'I’m developing android, iOS, and web applications using Flutter platform.',
                          icon: ImageAssetConstants.flutter,
                          width: widget.width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Backend Development',
                          description:
                              'I’m developing backend applications using Codnuit and Spring Boot with a good knowledge in Node.js.',
                          icon: ImageAssetConstants.backendIcon,
                          width: widget.width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Python Development',
                          description:
                              'I’m developing machine learning and deep learning projects using standard Python libraries and TensorFlow API.',
                          icon: ImageAssetConstants.python,
                          width: widget.width,
                          ratio: 0.35,
                        ),
                      ],
                    ),
                    SizedBox(width: 0.05 * widget.width),
                    // Hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HelloWithBio(
                          ratio: 0.4,
                          width: widget.width,
                        ),
                        const SizedBox(height: 30),
                        Info(width: widget.width, ratio: 0.4),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                          title: 'Flutter Development',
                          description:
                              'I’m developing android, iOS, and web applications using Flutter platform.',
                          icon: ImageAssetConstants.flutter,
                          width: 2 * widget.width,
                          ratio: 0.45,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Backend Development',
                          description:
                              'I’m developing backend applications using Codnuit and Spring Boot with a good knowledge in Node.js.',
                          icon: ImageAssetConstants.backendIcon,
                          width: 2 * widget.width,
                          ratio: 0.45,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Python Development',
                          description:
                              'I’m developing machine learning and deep learning projects using standard Python libraries and TensorFlow API.',
                          icon: ImageAssetConstants.python,
                          width: 2 * widget.width,
                          ratio: 0.45,
                        ),
                      ],
                    ),
                    // Hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        HelloWithBio(
                          width: 3 * widget.width,
                          ratio: 0.3,
                        ),
                        const SizedBox(height: 35),
                        Info(width: 3 * widget.width, ratio: 0.3),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
