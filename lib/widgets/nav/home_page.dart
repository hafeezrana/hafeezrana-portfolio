import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/all_nav_tabs_view/skill_view.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/nav/nav_bar1.dart';
import 'package:portfolio/widgets/skill_card.dart';
import 'package:portfolio/widgets/upper_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();

  final GlobalKey skillsKey = GlobalKey();

  final GlobalKey educationKey = GlobalKey();

  final GlobalKey experienceKey = GlobalKey();

  final GlobalKey projectsKey = GlobalKey();

  late final RxBool showFloatingButton;
  @override
  void initState() {
    showFloatingButton = false.obs;
    scrollController.addListener(() {
      if (scrollController.offset >= Breakpoints.floatingButton) {
        showFloatingButton.value = true;
      } else {
        showFloatingButton.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.brightBackground,
      floatingActionButton: ObxValue<RxBool>(
          (data) => Visibility(
                visible: data.value,
                child: FloatingActionButton(
                    onPressed: () => scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut),
                    backgroundColor: CustomColors.primary,
                    child: const Icon(Icons.arrow_upward,
                        color: CustomColors.darkBackground)),
              ),
          showFloatingButton),
      body: Column(
        children: [
          NavBar1(
            width: MediaQuery.of(context).size.width,
            homeKey: homeKey,
            skillsKey: skillsKey,
            educationKey: educationKey,
            experienceKey: experienceKey,
            projectsKey: projectsKey,
            scrollController: scrollController,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                      color: CustomColors.brightBackground,
                      key: homeKey,
                      width: width,
                      child: Column(
                        children: [
                          SizedBox(height: width * 0.09),
                          UpperContainer(width: width),
                        ],
                      )),
                  SkillConatiner(
                    width: width,
                    key: skillsKey,
                  ),
                  Container(
                    color: CustomColors.darkBackground,
                    key: educationKey,
                    child: Column(
                      children: [
                        SizedBox(height: width * 0.09),
                        MyTitleWidget(
                          title: 'Education',
                          width: width,
                        ),
                        Container(
                          color: CustomColors.darkBackground,
                          // key: educationKey,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                            left: width >= Breakpoints.lg
                                ? width * 0.1
                                : width * 0.05,
                          ),
                          child: ExperienceCard(
                            title:
                                'Bachelor of Science in Software\nEngineering (BSSE) ',
                            description: 'Grade: A',
                            width: width,
                            ratio: 0.35,
                            compnyName:
                                'National College of Business Administration and Economics (NCBAE)',
                            duration: '2020 -2024',
                            icon: ImageAssetConstants.ncbaLogo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: CustomColors.darkBackground,
                    key: experienceKey,
                    child: Column(
                      children: [
                        SizedBox(height: width * 0.09),
                        MyTitleWidget(
                          title: 'Experience',
                          width: width,
                        ),
                        Container(
                          color: CustomColors.darkBackground,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 45),
                                child: ExperienceCard(
                                  title: 'Flutter Developer',
                                  description:
                                      'Building mobile and web apps using Flutter Integrating real-time features like Google Maps.Implementing various payment methods Creating secure authentication systems.Utilizing Firebase for backend services Enabling offline functionality.Developing multimedia apps with camera and video features Building e-commerce applications Integrating in-app advertising Using AI for intelligent user experiences',
                                  width: width,
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
                                width: width,
                                ratio: 0.35,
                                compnyName: 'Sabroso Pakistan',
                                duration: 'Sep 2023 - Present',
                                icon: ImageAssetConstants.sabrosoLogo,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    key: projectsKey,
                    color: CustomColors.darkBackground,
                    child: Column(
                      children: [
                        SizedBox(height: width * 0.09),
                        MyTitleWidget(
                          title: 'My Projects',
                          width: width,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            // color: Colors.amber,
                            width: MediaQuery.of(context)
                                .size
                                .width, // Use MediaQuery.of(context).size.width
                            height: 350,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
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
                  ),
                  Container(
                    width: width,
                    height: 0.1,
                    color: CustomColors.gray,
                  ),
                  Footer(
                    width: width,
                    scrollController: scrollController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
