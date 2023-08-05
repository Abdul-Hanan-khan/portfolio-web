import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  SocialMediaIconBtn(
      {this.icon, this.socialLink, this.height, this.horizontalPadding});
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return icon.contains("https")? Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(
          icon,
          color: _themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        iconSize: height,
        onPressed: () {
          if(socialLink.contains("https")){
            launchURL(socialLink);
          }else{
            print("coming Soon");
          }
        },
        hoverColor: kPrimaryColor,
      ),
    ):Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.asset(
          icon,
          color: _themeProvider.lightTheme ? Colors.black : Colors.white,
        ),
        iconSize: height,
        onPressed: () {
          if(socialLink.contains("https")){
            launchURL(socialLink);
          }else{
            print("coming Soon");
          }
        },
        hoverColor: kPrimaryColor,
      ),
    );;
  }
}
