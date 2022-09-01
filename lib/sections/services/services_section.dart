import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_portfolio_web/sections/services/desktop_services_section.dart';
import 'package:responsive_portfolio_web/sections/services/mobile_services_section.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const ServiceMobile(),
      desktop: const DesktopServicesSection(),
      tablet: const ServiceMobile(),
    );
  }
}
