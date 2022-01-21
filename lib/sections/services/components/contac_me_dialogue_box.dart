import 'package:flutter/material.dart';
import 'package:responsive_portfolio_web/constants/constants.dart';
import 'package:responsive_portfolio_web/provider/themeProvider.dart';
import 'package:responsive_portfolio_web/widget/adaptive_text.dart';
import 'package:responsive_portfolio_web/widget/custom_buttons.dart';

class ContactMeDiaBox extends StatelessWidget {
  const ContactMeDiaBox({
    Key? key,
    required ThemeProvider themeProvider,
  })  : _themeProvider = themeProvider,
        super(key: key);

  final ThemeProvider _themeProvider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
      title: AdaptiveText(
        text: "Hire Me!",
        style: TextStyle(
            fontSize: 32.0,
            color: _themeProvider.lightTheme ? Colors.black : Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFilledBtn(
            height: 40.0,
            onPressed: () => launchURL("https://wa.me/?text=Hi Hamza!"),
            btnColor: const Color(0xff34CB62),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 8.0),
                Text("WhatsApp"),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          CustomFilledBtn(
            height: 40.0,
            onPressed: () => launchURL(
                "https://www.upwork.com/freelancers/~0197b0f6aaeba9675f"),
            btnColor: const Color(0xff13A800),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "https://img.icons8.com/ios-filled/50/000000/upwork.png",
                  height: 35.0,
                  color: Colors.white,
                ),
                const SizedBox(width: 8.0),
                const Text("Upwork"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
