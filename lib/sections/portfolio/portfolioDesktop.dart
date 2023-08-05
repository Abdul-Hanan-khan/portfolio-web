import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/animations/bottomAnimation.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/widget/customBtn.dart';
import 'package:portfolio_web_v2/widget/customTextHeading.dart';
import 'package:portfolio_web_v2/widget/projectCard.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/widget/slider_config.dart';
import 'package:get/get.dart';

class PortfolioDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final ScrollController scrollController = ScrollController();
    return Obx(
        ()=> dbController.isLoading.value ?Container(): Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.02),
        child:
          Column(
            children: [
              CustomSectionHeading(text: "\nPortfolio"),
              CustomSectionSubHeading(
                  text: "Here are few samples of my previous work :)\n\n"),
              SizedBox(
                height: width > 1200 ? height * 0.45 : width * 0.21,
                // width: width*0.5,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return VerticalDivider(
                        color: Colors.transparent,
                        width: width * 0.015,
                      );
                    },
                    itemBuilder: (context, index) {
                      return WidgetAnimator(
                        child: ProjectCard(
                          cardWidth: width < 1200 ? width * 0.2 : width * 0.2,
                          cardHeight: width < 1200 ? width * 0.2 : width * 0.2,
                          backImage: dbController.projects[index].logo,
                          projectIcon: dbController.projects[index].logo,
                          projectTitle: dbController.projects[index].title,
                          projectDescription: dbController.projects[index].description,
                          project: dbController.projects[index],
                        ),
                      );
                    },
                    itemCount: dbController.projects.length,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
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
