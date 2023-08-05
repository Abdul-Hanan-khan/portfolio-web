import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:portfolio_web_v2/widget/socialMediaIcon.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/db_controller.dart';
import '../../widget/adaptiveText.dart';
import '../../widget/customTextHeading.dart';

class ProjectDetailsTablet extends StatelessWidget {
  ProjectDetailsTablet(this.project);

  ProjectsModel project;
  DbController dbController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.09),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
            ),

            Container(
              width: width * 0.9,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AdaptiveText(
                    "${project.title}",
                    style: GoogleFonts.montserrat(
                      fontSize: width * 0.07,
                      color: Colors.grey[500],
                      height: 2.0,
                    ),
                  ),),
            ),
            Obx(
              ()=> dbController.loadingProject.value ? Center(child: CircularProgressIndicator(color: Colors.redAccent,), ): Container(
                // margin: EdgeInsets.only(top: height * 0.05),
                width: Get.width * 0.9,
                height: Get.height * 0.7,
                child:  CarouselSlider.builder(
                  itemCount: dbController.projectImages.length,
                  itemBuilder: (BuildContext context, int itemIndex, int i) =>
                      Container(
                    width: width * 0.9,
                    height: height * 0.5,
                    child: Image.memory(dbController.projectImages[i].image),
                  ),
                  options: CarouselOptions(
                      height: height * 0.6,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      enableInfiniteScroll: false),
                ),
              ),
            ),
            Container(
              width: Get.width * 0.9,
              // height: Get.height * 0.7,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 10,
                      ),
                      AdaptiveText(
                        "Description",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.020,
                          color: Colors.grey[500],
                          height: 2.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: height * 0.01,),
                      AdaptiveText(
                        "${project.description}",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                      ),
                      SizedBox(height:  height * 0.07,),
                      AdaptiveText(
                        "Details",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.020,
                          color: Colors.grey[500],
                          height: 2.0,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                      SizedBox(height: height * 0.01,),
                      AdaptiveText(
                        "${project.otherInfo}",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
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
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SocialMediaIconBtn(
                            icon: "assets/portf_icons/app-store.png",
                            socialLink: project.appStoreUrl,
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          SocialMediaIconBtn(
                            icon: "assets/portf_icons/play-store.png",
                            socialLink: project.playStoreUrl,
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: height * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
