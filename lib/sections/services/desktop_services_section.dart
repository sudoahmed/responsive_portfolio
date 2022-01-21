import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/custom_package.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/adaptive_text.dart';
import 'package:responsive_portfolio_web/widget/custom_buttons.dart';
import 'package:responsive_portfolio_web/widget/custom_text_heading.dart';
import 'package:responsive_portfolio_web/widget/service_card.dart';

class DesktopServicesSection extends StatefulWidget {
  const DesktopServicesSection({Key? key}) : super(key: key);

  @override
  _DesktopServicesSectionState createState() => _DesktopServicesSectionState();
}

class _DesktopServicesSectionState extends State<DesktopServicesSection> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nWhat I do"),
          CustomSectionSubHeading(
              text:
                  "I may not be perfect, but I am surely of some help : \n\n"),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ServiceCard(
                      serviceIcon: kServicesIcons[index],
                      serviceTitle: kServicesTitles[index],
                      serviceDescription: kServicesDescriptions[index],
                      serviceLink: kServicesLinks[index],
                      cardWidth: width < 1200 ? width * 0.25 : width * 0.22,
                      cardHeight: width < 1200 ? height * 0.37 : height * 0.35,
                      cardBack: ServiceCardBackWidget(
                          themeProvider: _themeProvider,
                          height: height,
                          width: width,
                          serviceDesc: kServicesDescriptions[index],
                          serviceTitle: kServicesTitles[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ServiceCard(
                        serviceIcon: kServicesIcons[index + 3],
                        serviceTitle: kServicesTitles[index + 3],
                        serviceDescription: kServicesDescriptions[index + 3],
                        serviceLink: kServicesLinks[index + 3],
                        cardWidth: width < 1200 ? width * 0.25 : width * 0.22,
                        cardHeight:
                            width < 1200 ? height * 0.37 : height * 0.35,
                        cardBack: ServiceCardBackWidget(
                            themeProvider: _themeProvider,
                            height: height,
                            width: width,
                            serviceDesc: kServicesDescriptions[index + 3],
                            serviceTitle: kServicesTitles[index + 3])),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
