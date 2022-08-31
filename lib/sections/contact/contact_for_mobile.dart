import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widget/custom_text_heading.dart';
import '../../widget/project_card.dart';

class MobileContact extends StatelessWidget {
  const MobileContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomSectionHeading(text: "\nGet in Touch"),
        const CustomSectionSubHeading(
            text: "Let's build something together :)\n\n"),
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ProjectCard(
              cardWidth: width > 480 ? width * 0.5 : width * 0.8,
              projectIconData: kContactIcons[i],
              projectTitle: kContactTitles[i],
              projectDescription: kContactDetails[i],
            ),
          ),
          options: CarouselOptions(
              height: height * 0.3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false),
        ),
      ],
    );
  }
}
