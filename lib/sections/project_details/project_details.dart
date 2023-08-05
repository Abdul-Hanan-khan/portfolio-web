// import 'package:flutter/material.dart';
// import 'package:folio/model/projects_model.dart';
// import 'package:folio/sections/portfolio/portfolioDesktop.dart';
// import 'package:folio/sections/portfolio/portfolioMobile.dart';
// import 'package:folio/sections/portfolio/portfolioTab.dart';
// import 'package:folio/sections/project_details/project_detials_desktop.dart';
// import 'package:responsive_builder/responsive_builder.dart';
//
// class ProjectDetails extends StatelessWidget {
//   ProjectDetails(this.projectsModel);
//
//   ProjectsModel projectsModel ;
//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout(
//       mobile: PortfolioTab(),
//       tablet: PortfolioTab(),
//       desktop: ProjectDetailsDesktop(projectsModel),
//     );
//   }
//
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/sections/brands/brands.dart';
import 'package:portfolio_web_v2/sections/portfolio/portfolioMobile.dart';
import 'package:portfolio_web_v2/sections/project_details/project_details_tab.dart';
import 'package:portfolio_web_v2/sections/project_details/project_detials_desktop.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/animations/entranceFader.dart';
import 'package:portfolio_web_v2/constants.dart';
import 'package:portfolio_web_v2/sections/about/about.dart';
import 'package:portfolio_web_v2/sections/contact/contact.dart';
import 'package:portfolio_web_v2/sections/home/home.dart';
import 'package:portfolio_web_v2/sections/navBar/navBarLogo.dart';
import 'package:portfolio_web_v2/sections/portfolio/portfolio.dart';
import 'package:portfolio_web_v2/sections/services/services.dart';
import 'package:portfolio_web_v2/widget/arrowOnTop.dart';
import 'package:portfolio_web_v2/widget/footer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDetails extends StatefulWidget {
  ProjectsModel project;

  ProjectDetails(this.project);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  ThemeProvider _themeProviders = ThemeProvider();




  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: _themeProv.lightTheme ? Colors.black : Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          NavBarLogo(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ),
      body: ScreenTypeLayout(
        mobile: ProjectDetailsTablet(widget.project),
        tablet:ProjectDetailsTablet(widget.project),
        desktop: ProjectDetailsDesktop(widget.project),
      )
    );
  }


}
