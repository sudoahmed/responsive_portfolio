import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_portfolio_web/animations/entranceFader.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/sections/about/about.dart';
import 'package:responsive_portfolio_web/sections/contact/contact.dart';
import 'package:responsive_portfolio_web/sections/home/home.dart';
import 'package:responsive_portfolio_web/sections/navBar/nav_bar_logo.dart';
import 'package:responsive_portfolio_web/sections/portfolio/portfolio.dart';
import 'package:responsive_portfolio_web/sections/services/services_section.dart';
import 'package:responsive_portfolio_web/widget/arrow_on_top.dart';
import 'package:responsive_portfolio_web/widget/footer.dart';
import 'package:universal_html/html.dart' as html;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ThemeProvider _themeProviders = ThemeProvider();
  ScrollController _scrollController = ScrollController();
  bool isPressed = false;
  bool _isScrollingDown = false;

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
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    if (i == 4) {
      _isScrollingDown = true;
    }
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
    _scrollController = _themeProviders.scroll;
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
        if (!_isScrollingDown) {
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
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
        appBar: MediaQuery.of(context).size.width > 760
            ? buildDesktopAppBar(_themeProv)
            //AppBar For Desktop
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [NavBarLogo()],
              ),
        drawer: MediaQuery.of(context).size.width < 760
            ? buildMobileAppBar(_themeProv)
            : null,
        body: Stack(
          children: [
            SectionsBody(
                scrollController: _scrollController,
                sectionsLength: _sectionsIcons.length,
                sectionWidget: sectionWidget),
            _isScrollingDown
                ? Positioned(
                    bottom: 80,
                    right: 30,
                    child: EntranceFader(
                      offset: Offset(0, 20),
                      child: ArrowOnTop(
                        onPressed: () => _scroll(0),
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }

  Drawer buildMobileAppBar(ThemeProvider _themeProv) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Material(
        color: _themeProv.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Center(
                child: NavBarLogo(
                  height: 18,
                ),
              ),
              Divider(
                color: _themeProv.lightTheme ? Colors.grey[900] : Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text(
                  "Dark Mode",
                  style: TextStyle(
                      color:
                          _themeProv.lightTheme ? Colors.black : Colors.white),
                ),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !_themeProv.lightTheme,
                  onChanged: (value) {
                    setState(() {
                      _themeProv.lightTheme = !value;
                    });
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: _themeProv.lightTheme ? Colors.grey[900] : Colors.white,
              ),
              for (var i = 0; i < _sectionsName.length; i++)
                _appBarActions(context, _sectionsName[i], i, _sectionsIcons[i],
                    _themeProv),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: kPrimaryColor)),
                  onPressed: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: GoogleFonts.montserrat(
                          color: _themeProv.lightTheme
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildDesktopAppBar(ThemeProvider _themeProv) {
    return AppBar(
      elevation: 0,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ),
            )
          : EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
      actions: [
        //TODO : Why web is not scrollibg by clicking on tabs.Fix !! Fix!! Fix!!!
        for (var i = 0; i < _sectionsName.length; i++)
          _appBarActions(
              context, _sectionsName[i], i, _sectionsIcons[i], _themeProv),
        EntranceFader(
          offset: Offset(0, -10),
          delay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 100),
          child: Container(
            height: 60.0,
            width: 120,
            padding: EdgeInsets.all(8),
            child: MaterialButton(
              onPressed: () {
                html.window.open(
                    "https://drive.google.com/drive/u/0/my-drive", "drive");
              },
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: kPrimaryColor),
              ),
              child: Text(
                "RESUME",
                style: GoogleFonts.montserrat(
                    color: _themeProv.lightTheme ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !_themeProv.lightTheme,
            onChanged: (value) {
              print(value);
              print(_themeProv.lightTheme);
              setState(() {
                _themeProv.lightTheme = !value;
              });
            },
            activeColor: kPrimaryColor,
          ),
        )
      ],
    );
  }

  Widget _appBarActions(BuildContext context, String childText, int index,
      IconData icon, ThemeProvider _themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            delay: Duration(milliseconds: 100),
            duration: Duration(milliseconds: 250),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  _scroll(index);
                }, //TODO : Gotcha baby
                child: Text(
                  childText,
                  style: TextStyle(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              hoverColor: kPrimaryColor.withAlpha(70),
              child: ListTile(
                leading: Icon(icon, color: kPrimaryColor),
                title: Text(
                  childText,
                  style: TextStyle(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white),
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
    return Container(
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
