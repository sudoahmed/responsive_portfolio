import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_portfolio_web/sections/contact/contact_for_desktop.dart';
import 'package:responsive_portfolio_web/sections/contact/contact_for_mobile.dart';
import 'package:responsive_portfolio_web/sections/contact/contact_for_tablet.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContact(),
      desktop: DesktopContact(),
      tablet: TabletContact(),
    );
  }
}
