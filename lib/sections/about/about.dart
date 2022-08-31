import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_portfolio_web/sections/about/desktop_about_section.dart';
import 'package:responsive_portfolio_web/sections/about/mobile_about_section.dart';
import 'package:responsive_portfolio_web/sections/about/tablet_about_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutMobile(),
      desktop: const DesktopAboutSection(),
      tablet: const TabletAboutSection(),
    );
  }
}
