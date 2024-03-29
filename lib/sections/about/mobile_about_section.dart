import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/sections/about/desktop_about_section.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../provider/themeProvider.dart';
import '../../widget/about_me_data.dart';
import '../../widget/community_icon_button.dart';
import '../../widget/custom_buttons.dart';
import '../../widget/custom_text_heading.dart';
import '../../widget/tool_tech_widget.dart';

class AboutMobile extends StatelessWidget {
  final _communityLogoHeight = [60.0, 90.0, 20.0, 70.0];

  AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ),
      color: themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nAbout Me"),
          const CustomSectionSubHeading(text: "Get to know me :)"),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/meMob.png',
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: GoogleFonts.montserrat(
                color: kPrimaryColor,
                fontSize: height * 0.025,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.028,
          ),
          Text(
            kIntroTitle,
            style: GoogleFonts.montserrat(
              fontSize: height * 0.022,
              fontWeight: FontWeight.w400,
              color: themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            kIntroDescription,
            style: GoogleFonts.montserrat(
              fontSize: height * 0.018,
              color: Colors.grey[500],
              height: 1.5,
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[900]!,
                  width: 1.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Technologies I have worked with:",
              style: GoogleFonts.montserrat(
                  color: kPrimaryColor, fontSize: height * 0.015),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < 4; i++)
                ToolTechWidget(
                  techName: kTools[i],
                ),
            ],
          ),
          Row(
            children: [
              for (int i = 4; i < 8; i++)
                ToolTechWidget(
                  techName: kTools[i],
                ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[900]!,
                  width: 1.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const AboutMeData(
            data: "Name",
            information: "Muhammad Ahmad Ansari",
            alignment: Alignment.centerLeft,
          ),
          const AboutMeData(
            data: "Email",
            information: "sudoahmed2001@gmail.com",
            alignment: Alignment.centerLeft,
          ),
          const AboutMeData(
            data: "Age",
            information: "20",
            alignment: Alignment.centerLeft,
          ),
          const AboutMeData(
            data: "From",
            information: "Karachi, PK",
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedCustomBtn(
                      btnText: "Resume",
                      onPressed: () {
                        // kIsWeb
                        //     ? html.window.open(
                        //         'https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing',
                        //         "pdf")
                        //     : launchURL(
                        //         'https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing');
                      }),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (var i = 0; i < kCommunityLogo.length; i++)
                CommunityIconBtn(
                    icon: kCommunityLogo[i],
                    link: kCommunityLinks[i],
                    height: _communityLogoHeight[i])
            ]),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: width * 0.8,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[900]!,
                  width: 2.0,
                ),
              ),
            ),
          ),

          // kCommunityLogo
          //     .asMap()
          //     .entries
          //     .map(
          //       (e) => CommunityIconBtn(
          //         icon: kCommunityLogo[e.key],
          //         link: kCommunityLinks[e.key],
          //         height: _communityLogoHeight[e.key],
          //       ),
          //     )
          //     .toList(),
        ],
      ),
    );
  }
}
