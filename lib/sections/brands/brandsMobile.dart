import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/animations/bottomAnimation.dart';
import 'package:portfolio_web_v2/main.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/sections/serviceDetails/serviceDetails.dart';
import 'package:portfolio_web_v2/widget/adaptiveText.dart';
import 'package:portfolio_web_v2/widget/customBtn.dart';
import 'package:portfolio_web_v2/widget/customTextHeading.dart';
import 'package:portfolio_web_v2/widget/serviceCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BrandsMobile extends StatefulWidget {
  @override
  _BrandsMobileState createState() => _BrandsMobileState();
}

class _BrandsMobileState extends State<BrandsMobile> {
  // GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nBrands i Worked With",fontSize:  width * 0.07),
          CustomSectionSubHeading(
              text:
              "Few commercial businesses helped me growing my career :)\n\n"),
          Container(
            height: 20.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 19.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(brands[index]),fit: BoxFit.contain
                              )
                          ),
                          // color: Colors.teal,
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
