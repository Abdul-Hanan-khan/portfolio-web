import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/sections/contact/contactDesktop.dart';
import 'package:portfolio_web_v2/sections/contact/contactMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
