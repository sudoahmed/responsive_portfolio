import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/custom_text_heading.dart';
import 'package:responsive_portfolio_web/widget/project_card.dart';

class DesktopContact extends StatelessWidget {
  const DesktopContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        children: [
          CustomSectionHeading(text: "\nGet in Touch"),
          CustomSectionSubHeading(text: "Let's build something together"),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              kContactTitles.length,
              (index) => ProjectCard(
                cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                cardHeight: width < 1200 ? height * 0.28 : height * 0.25,
                projectIconData: kContactIcons[index],
                projectTitle: kContactTitles[index],
                projectDescription: kContactDetails[index],
                projectLink: kContactLinks[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
