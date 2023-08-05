import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/sections/project_details/project_details.dart';
import 'package:portfolio_web_v2/widget/adaptiveText.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Uint8List projectIcon;
  final IconData projectIconData;
  final String projectTitle;
  final String projectDescription;
  // final String projectLink;
  final double cardWidth;
   bool disableHover;
  final double cardHeight;
  final Uint8List backImage;
  final Widget bottomWidget;
  final ProjectsModel project;

   ProjectCard(
      {Key key,
        this.backImage,
        this.bottomWidget,
        this.projectIcon,
        this.projectTitle,
        this.projectDescription,
        this.disableHover,
        // this.projectLink,
        this.projectIconData,
        this.cardWidth,
        this.cardHeight,
        this.project
      })
      : super(key: key);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  DbController dbController = Get.find();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    if(widget.disableHover == null){
    widget.disableHover = false;
    isHover = false;
    }else {
      isHover = true;
    }
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        dbController.fetchProjectImages(widget.project.id);
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProjectDetails(widget.project)));
      },
      // onTap: () => launch(widget.projectLink),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {

            if(widget.disableHover){
              isHover = false;
            }else{
              isHover = true;
            }

          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
          border: Border(
            bottom: isHover
                ? BorderSide(
              color: kPrimaryColor,
              width: 3.0,
            )
                : BorderSide(
              color:
              _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
            ),
          ),
          boxShadow: isHover
              ? [
            BoxShadow(
              color: kPrimaryColor.withAlpha(100),
              blurRadius: 12.0,
              offset: Offset(0.0, 0.0),
            )
          ]
              : [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 12.0,
              offset: Offset(0.0, 0.0),
            )
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? (width > 1135 || width < 950)
                    ? Image.memory(
                  widget.projectIcon,
                  height: height * 0.05,
                )
                    : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.memory(
                      widget.projectIcon,
                      height: height * 0.03,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    isHover == true ? Text(
                      widget.projectTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: height * 0.015,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ):Container(),
                  ],
                )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                  widget.projectIconData,
                  color: kPrimaryColor,
                  size: height * 0.1,
                )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                  height: height * 0.02,
                )
                    : SizedBox(),
                (width > 1135 || width < 950)
                    ? AdaptiveText(
                  widget.projectTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.02,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                    color: _themeProvider.lightTheme
                        ? Colors.white
                        : Colors.grey[900],
                  ),
                )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
             isHover?   AdaptiveText(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.015,
                      letterSpacing: 2.0,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w300,
                      height: width >= 600 ? 2.0 : 1.2),
                ):Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                widget.bottomWidget ?? Container(),
              ],
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: widget.backImage != null
                  ? CircleAvatar(
                  radius: 30,
                  backgroundColor:_themeProvider.lightTheme ? Colors.white : Colors.grey[900],
                  child: SizedBox(height: widget.cardHeight - (widget.cardHeight/3) ,width: widget.cardWidth - (widget.cardWidth/3),child: Image.memory(widget.backImage),),)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

}
