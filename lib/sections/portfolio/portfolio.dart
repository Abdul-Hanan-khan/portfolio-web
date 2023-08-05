import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/sections/portfolio/portfolioDesktop.dart';
import 'package:portfolio_web_v2/sections/portfolio/portfolioMobile.dart';
import 'package:portfolio_web_v2/sections/portfolio/portfolioTab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: PortfolioTab(),
      tablet: PortfolioTab(),
      desktop: PortfolioDesktop(),
    );
  }
}
