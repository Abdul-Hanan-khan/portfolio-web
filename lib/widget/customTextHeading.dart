

import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomSectionHeading({Key key, @required this.text,this.fontSize=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: fontSize == null || fontSize == 0.0? MediaQuery.of(context).size.height * 0.075:fontSize,
        fontWeight: FontWeight.w100,
        letterSpacing: 1.0,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),

    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;
  double wordSpacing = 0.0;

   CustomSectionSubHeading({Key key, @required this.text,this.wordSpacing =0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return AdaptiveText(
      text,
      style: GoogleFonts.montserrat(
        wordSpacing: wordSpacing < 0.0 || wordSpacing == null ? 0.0:wordSpacing,

        fontWeight: FontWeight.w200,
        color: _themeProvider.lightTheme ? Colors.black : Colors.white,
      ),
    );
  }
}
