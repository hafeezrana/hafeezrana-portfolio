// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:portfolio/widgets/components/project_info.dart';

// import '../../../model/project_model.dart';

// class ProjectGrid extends StatelessWidget {
//   final int crossAxisCount;
//   final double ratio;
//   ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
//   final controller = Get.put(ProjectController());
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       itemCount: projectList.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount, childAspectRatio: ratio),
//       itemBuilder: (context, index) {
//         return Obx(() => AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             margin: const EdgeInsets.symmetric(
//                 vertical: defaultPadding, horizontal: defaultPadding),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 gradient: const LinearGradient(colors: [
//                   Colors.pinkAccent,
//                   Colors.blue,
//                 ]),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.pink,
//                     offset: const Offset(-2, 0),
//                     blurRadius: controller.hovers[index] ? 20 : 10,
//                   ),
//                   BoxShadow(
//                     color: Colors.blue,
//                     offset: const Offset(2, 0),
//                     blurRadius: controller.hovers[index] ? 20 : 10,
//                   ),
//                 ]),
//             child: ProjectStack(index: index)));
//       },
//     );
//   }
// }

// class ProjectController extends GetxController {
// }


// class ProjectStack extends StatelessWidget {
//   final int index;

//   const ProjectStack({Key key, this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Your implementation of ProjectStack widget
//     // This is where you define the UI for your project item
//     return Container(
//       // Your widget's UI implementation
//       child: Text('Project Stack $index'),
//     );
//   }
// }
