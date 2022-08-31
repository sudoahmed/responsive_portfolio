import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_portfolio_web/sections/portfolio/portfolio_for_desktop.dart';
import 'package:responsive_portfolio_web/sections/portfolio/portfolio_for_mobile.dart';
import 'package:responsive_portfolio_web/sections/portfolio/portfolio_for_tablet.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobilePortfolio(),
      desktop: const DesktopPortfolio(),
      tablet: TabletPortfolio(),
    );
  }
}
