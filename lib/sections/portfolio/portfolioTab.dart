import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/widget/customBtn.dart';
import 'package:portfolio_web_v2/widget/customTextHeading.dart';
import 'package:portfolio_web_v2/widget/projectCard.dart';
import 'package:get/get.dart';

class PortfolioTab extends StatelessWidget {
  DbController dbController = Get.find();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
          ()=> dbController.isLoading.value?Container(): Container(
        child: Column(
          children: [
            CustomSectionHeading(text: "\nPortfolio",fontSize: width * 0.07),
            CustomSectionSubHeading(
                text: "Here are few samples of my previous work :)\n\n"),
            CarouselSlider.builder(
              itemCount: dbController.projects.length,
              itemBuilder: (BuildContext context, int itemIndex, int i) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ProjectCard(
                      cardWidth: width < 600 ? width * 0.6 : width * 0.4,
                      cardHeight: width < 600 ? width * 0.6 : width * 0.4,
                      backImage: dbController.projects[i].logo,
                      projectIcon: dbController.projects[i].logo,
                      projectTitle: dbController.projects[i].title,
                      projectDescription: dbController.projects[i].description,
                      project: dbController.projects[i],
                      // projectLink: kProjectsLinks[i],
                    ),
                  ),
              options: CarouselOptions(
                  height: height * 0.4,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: false),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            OutlinedCustomBtn(
                btnText: "See More",
                onPressed: () {
                  launchURL("https://github.com/Abdul-Hanan-khan");
                })
          ],
        ),
      ),
    );
  }
}
