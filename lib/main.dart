import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/dummy/document_snapshot.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:portfolio_web_v2/provider/themeProvider.dart';
import 'package:portfolio_web_v2/provider/themeStyles.dart';
import 'package:portfolio_web_v2/sections/getInTouch/getInTouch.dart';
import 'package:portfolio_web_v2/sections/mainSection.dart';
import 'package:portfolio_web_v2/sections/project_details/project_details.dart';
import 'package:portfolio_web_v2/sections/serviceDetails/serviceDetails.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'sections/project_details/project_detials_desktop.dart';

void main() async{
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyA9sR5DV4Ugnq9oKGWm7sDYWLwyHo_wumc',
        appId: '1:818017839275:web:c14024fb1403ef4583afee',
        messagingSenderId: '818017839275',
        projectId: 'folio-admin-a8b06'),
  );
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider _themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    _themeProvider.lightTheme = await _themeProvider.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    var controller = Get.put(DbController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Sizer(
        builder: (context,orientation,deviceType){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hanan',
            theme: ThemeStyles.themeData(_themeProvider.lightTheme, context),
            initialRoute: "/",
            routes: {
              "/": (context) => MainPage(),
              // "/": (context) => ProjectDetails(ProjectsModel()),
              "/workTogether": (context) => GetInTouch(),
              "/details": (context) => ServiceDetails()
            },
          );
        },

      ),
    );
  }
}
