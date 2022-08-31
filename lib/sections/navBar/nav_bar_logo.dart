import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';

class NavBarLogo extends StatelessWidget {
  NavBarLogo({
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    Color textColor = _themeProvider.lightTheme ? Colors.black : Colors.white;

    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: TextStyle(
              fontSize: height ?? 20,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          " Ahmed ",
          style: TextStyle(
              fontFamily: "Agustina",
              fontSize: height ?? 10,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : "/>",
          style: TextStyle(
              fontSize: height ?? 20,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
