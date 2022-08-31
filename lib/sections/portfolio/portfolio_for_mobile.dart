import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widget/custom_buttons.dart';
import '../../widget/custom_text_heading.dart';
import '../../widget/project_card.dart';

class MobilePortfolio extends StatelessWidget {
  const MobilePortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomSectionHeading(text: "\nPortfolio"),
        const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n"),
        CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ProjectCard(
              cardWidth: width < 650 ? width * 0.8 : width * 0.4,
              projectIcon: kProjectsIcons[i],
              projectTitle: kProjectsTitles[i],
              projectDescription: kProjectsDescriptions[i],
              projectLink: kProjectsLinks[i],
            ),
          ),
          options: CarouselOptions(
              height: height * 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        OutlinedCustomBtn(
            btnText: "See More",
            onPressed: () {
              launchURL("https://github.com/sudoahmed");
            })
      ],
    );
  }
}
