import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/adaptive_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard(
      {Key? key,
      this.projectIcon,
      this.projectIconData,
      required this.projectTitle,
      required this.projectDescription,
      this.projectLink,
      required this.cardWidth,
      required this.cardHeight,
      this.backImage,
      this.bottomWidget})
      : super(key: key);
  final String? projectIcon;
  final IconData? projectIconData;
  final String projectTitle;
  final String projectDescription;
  final String? projectLink;
  final double cardWidth;
  final double cardHeight;
  final String? backImage;
  final Widget? bottomWidget;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => launch(widget.projectLink.toString()),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
            color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
            border: Border(
              bottom: isHover
                  ? BorderSide(
                      color: kPrimaryColor,
                      width: 3.0,
                    )
                  : BorderSide(
                      color: _themeProvider.lightTheme
                          ? Colors.white
                          : Colors.grey),
            ),
            boxShadow: isHover
                ? [
                    BoxShadow(
                        color: kPrimaryColor.withAlpha(100),
                        blurRadius: 12.0,
                        offset: Offset(0.0, 0.0))
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 12.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            widget.projectIcon.toString(),
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                widget.projectIcon.toString(),
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                widget.projectTitle,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: height * 0.015,
                                    letterSpacing: 1.5,
                                    color: _themeProvider.lightTheme
                                        ? Colors.black
                                        : Colors.white),
                              )
                            ],
                          )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: kPrimaryColor,
                        size: height * 0.1,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : SizedBox(),
                (width > 1135 || width < 950)
                    ? AdaptiveText(
                        text: widget.projectTitle,
                        style: GoogleFonts.montserrat(
                            fontSize: height * 0.02,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                            color: _themeProvider.lightTheme
                                ? Colors.white
                                : Colors.grey[900]),
                        textAlign: TextAlign.center,
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                AdaptiveText(
                  text: widget.projectDescription,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.015,
                      letterSpacing: 2.0,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                widget.bottomWidget ?? Container()
              ],
            ),
            AnimatedOpacity(
              opacity: isHover ? 0.0 : 1.0,
              duration: Duration(milliseconds: 400),
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.backImage != null
                    ? Image.asset(widget.backImage.toString())
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
