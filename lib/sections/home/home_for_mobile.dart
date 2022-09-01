import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/social_media_icon_button.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    Color textColor = _themeProvider.lightTheme ? Colors.black : Colors.white;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: -width * 0.11,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  "assets/ahmed.png",
                  height: height * 0.65,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.07, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "HEY THERE!",
                        style: GoogleFonts.montserrat(
                            fontSize: height * 0.025,
                            color: textColor,
                            fontWeight: FontWeight.w200),
                      ),
                      Image.asset(
                        "assets/hi.gif",
                        height: 0.03,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Muhammad",
                    style: GoogleFonts.montserrat(
                        fontSize: height * 0.055,
                        color: textColor,
                        fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "Ahmad",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.055,
                        color: textColor),
                  ),
                  Row(
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
                        speed: const Duration(
                          milliseconds: 50,
                        ),
                        textStyle: GoogleFonts.montserrat(
                            fontSize: height * 0.03,
                            color: textColor,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: height * 0.077,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < kSocialIcons.length; i++)
                        SocialMediaIconsBtn(
                            icon: kSocialIcons[i],
                            socialLink: kSocialLinks[0],
                            height: height * 0.03,
                            horizontalPadding: 2.0)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
