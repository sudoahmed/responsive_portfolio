import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/sections/about/about.dart';
import 'package:responsive_portfolio_web/sections/contact/contact.dart';
import 'package:responsive_portfolio_web/sections/portfolio/portfolio.dart';
import 'package:responsive_portfolio_web/sections/services/services_section.dart';
import 'package:responsive_portfolio_web/widget/footer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animations/entranceFader.dart';
import '../provider/themeProvider.dart';
import '../widget/arrow_on_top.dart';
import 'home/home.dart';
import 'navBar/nav_bar_logo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final ThemeProvider _themeProviders = ThemeProvider();
  bool isPressed = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.article,
    Icons.phone,
  ];

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return const HomePage();
    } else if (i == 1) {
      return const AboutSection();
    } else if (i == 2) {
      return const ServicesSection();
    } else if (i == 3) {
      return const PortfolioSection();
    } else if (i == 4) {
      return const ContactSection();
    } else if (i == 5) {
      return const Footer();
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    _scrollController = _themeProviders.scrollController;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.purple,
      //backgroundColor: themeProv.lightTheme ? Colors.white : Colors.black,
      appBar: MediaQuery.of(context).size.width < 760
          ? AppBar(
              iconTheme: IconThemeData(
                  color: themeProv.lightTheme ? Colors.black : Colors.white),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                NavBarLogo(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            )
          : _appBarTabDesktop(themeProv),
      drawer: MediaQuery.of(context).size.width < 760
          ? _appBarMobile(themeProv)
          : null,
      body: Stack(
        children: [
          SectionsBody(
            scrollController: _scrollController,
            sectionsLength: _sectionsIcons.length,
            sectionWidget: sectionWidget,
          ),
          _isScrollingDown
              ? Positioned(
                  bottom: 90,
                  right: 0,
                  child: EntranceFader(
                      offset: const Offset(0, 20),
                      child: ArrowOnTop(
                        onPressed: () => _scroll(0),
                      )))
              : Container()
        ],
      ),
    );
  }

  //App Bar For Tablets
  Widget _appBarActionsTablet(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760 &&
            MediaQuery.of(context).size.width < 1024
        ? EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              height: 60.0,
              child: MaterialButton(
                  hoverColor: kPrimaryColor,
                  onPressed: () => _scroll(index),
                  child: Icon(icon)),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  Widget _appBarActionsDesktop(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  AppBar _appBarTabDesktop(ThemeProvider themeProv) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: themeProv.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ))
          : EntranceFader(
              offset: const Offset(0, -10),
              duration: const Duration(milliseconds: 250),
              delay: const Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          //_appBarActionsDesktop(_sectionsName[i], i, _sectionsIcons[i], themeProv),
          MediaQuery.of(context).size.width <= 480
              ? MobileAppBarActions(
                  themeProv: _themeProviders,
                )
              : MediaQuery.of(context).size.width > 480 &&
                      MediaQuery.of(context).size.width <= 950
                  ? _appBarActionsTablet(
                      _sectionsName[i], i, _sectionsIcons[i], themeProv)
                  : _appBarActionsDesktop(
                      _sectionsName[i], i, _sectionsIcons[i], themeProv),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !themeProv.lightTheme,
            onChanged: (value) {
              themeProv.lightTheme = !value;
            },
            activeColor: kPrimaryColor,
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: const Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActionsDesktop(
                    _sectionsName[i], i, _sectionsIcons[i], theme),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: kPrimaryColor)),
                  onPressed: () {
                    launchURL(
                        "https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing");
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: theme.lightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileAppBarActions extends StatelessWidget {
  const MobileAppBarActions({
    Key? key,
    required this.themeProv,
  }) : super(key: key);

  final ThemeProvider themeProv;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        height: 60.0,
        width: 120.0,
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          hoverColor: kPrimaryColor.withAlpha(150),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: kPrimaryColor)),
          onPressed: () {
            html.window.open(
                'https://drive.google.com/file/d/1FaHIzT9FigDHLx8NlxFIyQfjJTyN9WQ6/view?usp=sharing',
                "pdf");
          },
          child: Text(
            "RESUME",
            style: GoogleFonts.montserrat(
              color: themeProv.lightTheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}

class SectionsBody extends StatelessWidget {
  final ScrollController scrollController;
  final int sectionsLength;
  final Widget Function(int) sectionWidget;

  const SectionsBody({
    Key? key,
    required this.scrollController,
    required this.sectionsLength,
    required this.sectionWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: sectionsLength,
        itemBuilder: (context, index) => sectionWidget(index),
      ),
    );
  }
}

// onPointerSignal: (ps) {
//           if (ps is PointerScrollEvent) {
//             final newOffset = scrollController.offset + ps.scrollDelta.dy;
//             if (ps.scrollDelta.dy.isNegative) {
//               scrollController.jumpTo(math.max(0, newOffset));
//             } else {
//               scrollController.jumpTo(math.min(
//                   scrollController.position.maxScrollExtent, newOffset));
//             }
//           }
//         },
