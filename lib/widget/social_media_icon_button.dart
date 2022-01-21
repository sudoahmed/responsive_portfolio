import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';

class SocialMediaIconsBtn extends StatelessWidget {
  SocialMediaIconsBtn({
    Key? key,
    required this.icon,
    required this.socialLink,
    required this.height,
    required this.horizontalPadding,
  }) : super(key: key);

  final String socialLink, icon;
  final double height;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        onPressed: () => print(_themeProvider.lightTheme),
        icon: Image.network(
          icon,
          color: _themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        iconSize: height,
        hoverColor: kPrimaryColor,
      ),
    );
  }
}
