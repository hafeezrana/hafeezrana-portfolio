// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/hello_with_bio.dart';
import 'package:portfolio/widgets/info.dart';
import 'package:portfolio/widgets/intrest.dart';
import 'package:portfolio/widgets/skill_card.dart';

class LowerContainer extends StatefulWidget {
  final double width;
  final List<Map> intrests;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;

  const LowerContainer({
    Key? key,
    required this.width,
    required this.intrests,
    required this.intrestsKey,
    required this.skillsKey,
  }) : super(key: key);

  @override
  State<LowerContainer> createState() => _LowerContainerState();
}

class _LowerContainerState extends State<LowerContainer> {
  // final GlobalKey projectKey;
  final GlobalKey projectKey = GlobalKey();
  final bool _isExpanded = false;
  final List<bool> _isExpandedList = List.filled(projectList.length, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      key: widget.skillsKey,
      color: CustomColors.brightBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

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
          SizedBox(height: widget.width * 0.07),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: widget.width >= Breakpoints.lg
                  ? widget.width * 0.1
                  : widget.width * 0.05,
            ),
            child: Text(
              'Education',
              style: GoogleFonts.getFont(
                'Delius',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),

          SizedBox(height: widget.width * 0.03),
          // Interests grid
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return SizedBox(
                  width: widget.width * 0.76,
                  height: 100,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: widget.intrests[index]['intrest'],
                      color: widget.intrests[index]['color'],
                      textColor: widget.intrests[index]['textColor'],
                      key: index == 4 ? widget.intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(2),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              } else if (constraints.maxWidth < Breakpoints.lg &&
                  constraints.maxWidth >= Breakpoints.sm) {
                return SizedBox(
                  width: widget.width * 0.76,
                  height: 180,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: widget.intrests[index]['intrest'],
                      color: widget.intrests[index]['color'],
                      textColor: widget.intrests[index]['textColor'],
                      key: index == 4 ? widget.intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(4),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              } else {
                return SizedBox(
                  width: widget.width * 0.76,
                  height: 360,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: widget.intrests[index]['intrest'],
                      color: widget.intrests[index]['color'],
                      textColor: widget.intrests[index]['textColor'],
                      key: index == 4 ? widget.intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(8),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
            },
          ),
//=================Education========//
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: widget.width >= Breakpoints.lg
                  ? widget.width * 0.1
                  : widget.width * 0.05,
            ),
            child: Text(
              'Education',
              style: GoogleFonts.getFont(
                'Delius',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),

          LayoutBuilder(builder: (context, constraints) {
            return Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: widget.width >= Breakpoints.lg
                    ? widget.width * 0.1
                    : widget.width * 0.05,
              ),
              child: ExperienceCard(
                title: 'Bachelor of Science in Software\nEngineering (BSSE) ',
                description: 'Grade: A',
                width: widget.width,
                ratio: 0.35,
                compnyName:
                    'National College of Business Administration and Economics (NCBAE)',
                duration: '2020 -2024',
                icon: ImageAssetConstants.ncbaLogo,
              ),
            );
          }),
//=================Experience==============//
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: widget.width >= Breakpoints.lg
                  ? widget.width * 0.1
                  : widget.width * 0.05,
            ),
            child: Text(
              'Experience',
              style: GoogleFonts.getFont(
                'Delius',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: ExperienceCard(
                  title: 'Flutter Developer',
                  description:
                      'Building mobile and web apps using Flutter Integrating real-time features like Google Maps.Implementing various payment methods Creating secure authentication systems.Utilizing Firebase for backend services Enabling offline functionality.Developing multimedia apps with camera and video features Building e-commerce applications Integrating in-app advertising Using AI for intelligent user experiences',
                  width: widget.width,
                  ratio: 0.35,
                  compnyName: 'DevLynx Technologies Pvt. Ltd ',
                  duration: 'Apr 2023 - Feb 2024 · 11 mos',
                  icon: ImageAssetConstants.devLynxLogo,
                ),
              ),
              ExperienceCard(
                title: 'Senior Flutter Developer',
                description:
                    'Led the creation of multi-platform mobile applications encompassing Sales and Purchase Officer tracking, Order Management, Assets, HR, Audit, Stock Return, ERP, and Market Receipt Management, alongside implementing SABROSO \'s home delivery service. Leveraged Flutter Framework and Oracle Apex to ensure scalable and efficient database solutions.',
                width: widget.width,
                ratio: 0.35,
                compnyName: 'Sabroso Pakistan',
                duration: 'Sep 2023 - Present',
                icon: ImageAssetConstants.sabrosoLogo,
              ),
            ],
          ),

          const SizedBox(height: 10),

          const SizedBox(height: 10),

          //==================My projects============//
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: widget.width >= Breakpoints.lg
                  ? widget.width * 0.1
                  : widget.width * 0.05,
            ),
            child: Text(
              'My projects',
              style: GoogleFonts.getFont(
                'Delius',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Container(
              // color: Colors.amber,
              width: MediaQuery.of(context)
                  .size
                  .width, // Use MediaQuery.of(context).size.width
              height: 350,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projectList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    title: projectList[index].name,
                    description: projectList[index].description,
                    projectImg: projectList[index].image,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
