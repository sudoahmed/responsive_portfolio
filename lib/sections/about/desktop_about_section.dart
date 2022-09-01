import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/adaptive_text.dart';
import 'package:responsive_portfolio_web/widget/community_icon_button.dart';
import 'package:responsive_portfolio_web/widget/custom_buttons.dart';
import 'package:responsive_portfolio_web/widget/custom_text_heading.dart';
import 'package:responsive_portfolio_web/widget/tool_tech_widget.dart';

const kIntroTitle =
    'I\'m Muhammad Ahmad, a Flutter developer, Software Engineer and technology enthusiast.';
const String kIntroDescription =
    'I\'m a 3rd Year Computer Science student enrolled in Sir Syed University, Karachi. I have been developing mobile apps for over 2 years now. I have worked in teams for various startups and helped them in launching their prototypes and got valuable learning experiences. I\'m an active Google Developer Student Clubs (DSC) member and also very enthusiastic to learn generally about Mobile App Development and specifically about Flutter.';

class DesktopAboutSection extends StatelessWidget {
  const DesktopAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    Color textColor = _themeProvider.lightTheme ? Colors.black : Colors.white;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _communityLogoHeight = [60.0, 70.0, 30.0];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      color: _themeProvider.lightTheme ? Colors.white : Colors.black,
      child: Column(
        children: [
          CustomSectionHeading(text: "\nAbout Me"),
          CustomSectionSubHeading(text: "Get to know Me"),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/me2.png",
                  height: height * 0.7,
                ),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Column(
                  children: [
                    AdaptiveText(
                      text: kIntroTitle,
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w400,
                          color: textColor),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    AdaptiveText(
                      text: kIntroDescription,
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.02,
                          color: Colors.grey[500],
                          height: 2.0),
                    ),
                    Divider(
                      color: Colors.grey[800],
                      height: height * 0.02,
                    ),
                    AdaptiveText(
                      text: "Technologies I have worked with : ",
                      style: GoogleFonts.montserrat(
                        color: kPrimaryColor,
                        height: height * 0.0018,
                      ),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < kTools.length; i++)
                          ToolTechWidget(techName: kTools[i]),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[800],
                      height: height * 0.09,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdaptiveText(
                          text: "Name : Muhammad Ahmad Ansari",
                          style: GoogleFonts.montserrat(
                              height: 0.0018, color: textColor),
                        ),
                        AdaptiveText(
                          text: "Email : sudoahmed2001@gmail.com",
                          style: GoogleFonts.montserrat(
                              height: 0.0018, color: textColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdaptiveText(
                          text: "Age : 20",
                          style: GoogleFonts.montserrat(
                              height: 0.0018, color: textColor),
                        ),
                        AdaptiveText(
                          text: "From : Karachi, PK",
                          style: GoogleFonts.montserrat(
                              height: 0.0018, color: textColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedCustomBtn(btnText: "RESUME", onPressed: () {}),
                        Container(
                          width: width * 0.05,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 2.0),
                            ),
                          ),
                        ),
                        for (var i = 0; i < kCommunityLogo.length; i++)
                          CommunityIconBtn(
                              icon: kCommunityLogo[i],
                              link: kCommunityLinks[i],
                              height: _communityLogoHeight[i])
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
