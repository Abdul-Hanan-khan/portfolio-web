import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/sections/brands/brandsDesktop.dart';
import 'package:portfolio_web_v2/sections/brands/brandsMobile.dart';
import 'package:portfolio_web_v2/sections/services/servicesDesktop.dart';
import 'package:portfolio_web_v2/sections/services/servicesMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Brands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: BrandsMobile(),
      tablet: BrandsDesktop(),
      desktop: BrandsDesktop(),
    );
  }
}
