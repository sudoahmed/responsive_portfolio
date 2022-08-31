import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/sections/services/components/contac_me_dialogue_box.dart';

import 'adaptive_text.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {Key? key,
      required this.serviceIcon,
      required this.serviceTitle,
      required this.serviceDescription,
      this.serviceLink,
      required this.cardWidth,
      this.cardHeight,
      required this.cardBack})
      : super(key: key);

  final String serviceIcon, serviceTitle, serviceDescription;
  final String? serviceLink;
  final double cardWidth;
  final double? cardHeight;
  final Widget cardBack;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHover = false;
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    final _themProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (isTapped) {
          setState(() {
            isHover = true;
          });
          cardKey.currentState?.toggleCard();
        } else {
          setState(() {
            isHover = false;
          });
          cardKey.currentState?.toggleCard();
        }
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
          cardKey.currentState?.toggleCard();
        } else {
          setState(() {
            isHover = false;
          });
          cardKey.currentState?.toggleCard();
        }
      },
      child: FlipCard(
        flipOnTouch: kIsWeb ? false : true,
        key: cardKey,
        back: Container(
          width: widget.cardWidth,
          height: widget.cardHeight,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: _themProvider.lightTheme ? Colors.white : Colors.grey[900],
              border: Border(
                bottom: isHover
                    ? const BorderSide(color: kPrimaryColor, width: 3.0)
                    : const BorderSide(),
              ),
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: kPrimaryColor.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0, 0),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ]),
          child: widget.cardBack,
        ),
        front: Container(
          width: widget.cardWidth,
          height: widget.cardHeight,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: _themProvider.lightTheme ? Colors.white : Colors.grey[900],
              border: Border(
                bottom: isHover
                    ? const BorderSide(
                        color: kPrimaryColor,
                        width: 30.0,
                      )
                    : BorderSide(),
              ),
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: kPrimaryColor.withAlpha(100),
                        blurRadius: 12.0,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [
                      BoxShadow(
                          color: Colors.black.withAlpha(100),
                          blurRadius: 12.0,
                          offset: Offset(0, 0))
                    ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.serviceIcon, height: height * 0.125),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                widget.serviceTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: height * 0.022,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w500,
                    color:
                        _themProvider.lightTheme ? Colors.black : Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCardBackWidget extends StatelessWidget {
  const ServiceCardBackWidget(
      {Key? key,
      required ThemeProvider themeProvider,
      required this.height,
      required this.width,
      required this.serviceDesc,
      required this.serviceTitle})
      : _themeProvider = themeProvider,
        super(key: key);

  final ThemeProvider _themeProvider;
  final double height;
  final double width;
  final String serviceDesc;
  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdaptiveText(
          text: serviceDesc,
          style: GoogleFonts.montserrat(
            color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            fontSize: height * 0.015,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w400,
            height: width < 900 ? 1.5 : 1.8,
          ),
        ),
        const SizedBox(height: 25.0),
        const SizedBox(height: 10.0),
        Container(
          width: 250.0,
          height: 0.5,
          color:
              _themeProvider.lightTheme ? Colors.grey[400] : Colors.grey[100],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 40.0,
          width: 150.0,
          child: MaterialButton(
            color: kPrimaryColor,
            onPressed: () => showDialog(
                context: context,
                builder: (contecxt) =>
                    ContactMeDiaBox(themeProvider: _themeProvider)),
            child: Text(
              "HIRE ME!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
        )
      ],
    );
  }
}
