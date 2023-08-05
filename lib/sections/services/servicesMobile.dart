import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/sections/services/servicesDesktop.dart';
import 'package:portfolio_web_v2/widget/customTextHeading.dart';
import 'package:portfolio_web_v2/widget/serviceCard.dart';
import 'package:provider/provider.dart';

class ServiceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomSectionHeading(text: "\nWhat I Do",fontSize: width>480? width * 0.07 : width * 0.15),
          CustomSectionSubHeading(
              text: "I may not be perfect, but I'm surely of some help :)\n\n"),
          CarouselSlider.builder(
            itemCount: kServicesIcons.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ServiceCard(
                    cardWidth: width < 650 ? width * 0.8 : width * 0.5,
                    serviceIcon: kServicesIcons[i],
                    serviceTitle: kServicesTitles[i],
                    serviceDescription: kServicesDescriptions[i],
                    serviceLink: kServicesLinks[i],
                    cardBack: ServiceCardBackWidget(
                      serviceTitle: kServicesTitles[i],
                      serviceDesc: kServicesDescriptions[i],
                      themeProvider: _themeProvider,
                      height: height,
                      width: width,
                    ),
                  ),
                ),
            options: CarouselOptions(
                height: width < 450 ? height * 0.4 : height * 0.4,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: false),
          )
        ],
      ),
    );
  }
}
