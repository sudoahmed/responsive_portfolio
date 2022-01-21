import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_portfolio_web/sections/home/home_for_desktop.dart';
import 'package:responsive_portfolio_web/sections/home/home_for_mobile.dart';
import 'package:responsive_portfolio_web/sections/home/home_for_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
      tablet: HomeTablet(),
    );
  }
}
