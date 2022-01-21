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
    Color textColor = _themeProvider.lightTheme ? Colors.black : Colors.white;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 20.0, 0, 0),
      child: Row(
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
            " AHMED ",
            style: TextStyle(
                fontFamily: "Agustina",
                fontSize: height ?? 10,
                color: textColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: TextStyle(
                fontSize: height ?? 20,
                color: textColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
