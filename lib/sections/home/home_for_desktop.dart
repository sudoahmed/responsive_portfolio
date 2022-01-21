import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/animations/entranceFader.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/adaptive_text.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:responsive_portfolio_web/widget/social_media_icon_button.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:universal_html/js.dart';

import '../../custom_package.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height - 50,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: EntranceFader(
              offset: Offset(0, 0),
              delay: Duration(seconds: 1),
              duration: Duration(milliseconds: 800),
              child: Image.asset(
                'assets/1.png',
                height: width < 1200 ? height * 0.8 : height * 0.85,
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.2, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AdaptiveText(
                      text: "Welcome to my Portfolio",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w300,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    EntranceFader(
                      duration: Duration(milliseconds: 800),
                      delay: Duration(seconds: 2),
                      child: Image.asset(
                        "assets/hi.gif",
                        height: height * 0.0005,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                  ],
                ),
                AdaptiveText(
                    text: "Muhammad",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w100,
                        letterSpacing: 4.0,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                        fontSize:
                            width < 1200 ? height * 0.075 : height * 0.095),
                    textAlign: TextAlign.start),
                AdaptiveText(
                    text: "Ahmad",
                    style: GoogleFonts.montserrat(
                        fontSize:
                            width < 1200 ? height * 0.085 : height * 0.095,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5.0),
                    textAlign: TextAlign.left),
                EntranceFader(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                      ),
                      TyperAnimatedTextKit(
                        text: const [
                          " Flutter Developer",
                          " Technical Writer",
                          " UI/UX Enthusiast"
                        ],
                        isRepeatingAnimation: true,
                        speed: Duration(milliseconds: 50),
                        textStyle: GoogleFonts.montserrat(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w200,
                          color: _themeProvider.lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    kSocialIcons.length,
                    (index) => WidgetAnimator(
                      child: SocialMediaIconsBtn(
                        socialLink: kSocialLinks[index],
                        icon: kSocialIcons[index],
                        height: height * 0.035,
                        horizontalPadding: width * 0.005,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
