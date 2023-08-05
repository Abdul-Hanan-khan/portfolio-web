import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/animations/bottomAnimation.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:portfolio_web_v2/widget/adaptiveText.dart';
import 'package:portfolio_web_v2/widget/customBtn.dart';
import 'package:portfolio_web_v2/widget/customTextHeading.dart';
import 'package:portfolio_web_v2/widget/projectCard.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/widget/slider_config.dart';
import 'package:portfolio_web_v2/widget/socialMediaIcon.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDetailsDesktop extends StatelessWidget {
  ProjectsModel project;

  ProjectDetailsDesktop(this.project);

  DbController dbController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    debugPrint(width.toString());

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
          ()=> SizedBox(
              width: Get.width * 0.3,
              height: Get.height,
              child: dbController.loadingProject.value?Center(child: CircularProgressIndicator(color: Colors.redAccent,),) :CarouselSlider.builder(
                itemCount: dbController.projectImages.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int i) =>
                    Container(
                      width: width * 0.4,
                      height: height * 0.85,
                      child: Image.memory(dbController.projectImages[i].image),
                    ),
                options: CarouselOptions(
                    height: height * 0.85,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                    Duration(milliseconds: 800),
                    enableInfiniteScroll: false),
              ),
            ),
          ),
          Container(
            width: Get.width * 0.6,
            height: Get.height * 0.85,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.07),
                child: SingleChildScrollView(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSectionHeading(text: "${project.title}"),
                      SizedBox(height: 10,),
                      // CustomSectionSubHeading(
                      //   text: "${project.description}:)\n\n\n",
                      //   wordSpacing: 1.5,
                      // ),
                      AdaptiveText(
                        "${project.description}:)\n\n",
                        style: GoogleFonts.montserrat(
                          fontSize: width <1400 ? width * 0.013: width*0.01,
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                      ), AdaptiveText(
                        "${project.otherInfo}",
                        style: GoogleFonts.montserrat(
                          fontSize: width <1400 ? width * 0.013: width*0.01,
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                      ),
                      SizedBox(height: height * 0.05,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SocialMediaIconBtn(
                            icon: kSocialIcons[1],
                            socialLink: project.gitUrl,
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),

                          SizedBox(width: width * 0.01,),
                          SocialMediaIconBtn(
                            icon:"assets/portf_icons/app-store.png",
                            socialLink: project.appStoreUrl,
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),

                          SizedBox(width: width * 0.01,),
                          SocialMediaIconBtn(
                            icon: "assets/portf_icons/play-store.png",
                            socialLink: project.playStoreUrl,
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),
                        ],)

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
