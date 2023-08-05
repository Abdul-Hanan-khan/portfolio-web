import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
const Color kPrimaryColor = Color(0xffC0392B);

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  // "https://img.icons8.com/android/480/ffffff/twitter.png",
  // "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  // "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  // "https://img.icons8.com/ios-filled/500/ffffff/medium-monogram--v1.png"
];

const kSocialLinks = [
  "https://www.facebook.com/profile.php?id=100018048245361",
  "https://github.com/Abdul-Hanan-khan",
  // "https://twitter.com/mhmzdev",
  // "https://linkedin.com/in/mhmzdev",
  // "https://github.com/mhmzdev",
  // "https://mhamzadev.medium.com"
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final kCommunityLogo = [
  'assets/cui.png',

];

final kCommunityLinks = [
  "https://www.uaar.edu.pk/",

];

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Java",
  "Firebase",
  "SQF lite",
  "C++",
];

final brands=[
  "assets/brands/softech.PNG",
  "assets/brands/techo.png",
  "assets/brands/qmh.jpeg",
  "assets/brands/ensorcell.PNG",
];

// services
final kServicesIcons = [
  "assets/services/android.png",
  "assets/services/apple.png",
  "assets/services/worldwide.png",
];

final kServicesTitles = [
  "Android App Development with Flutter",
  "Ios App Development with Flutter",
  "Web Development with Flutter",
  // "Technical Blog Writing",
  // "Open Source - GitHub",
];

// final kServicesDescriptions = [
//   "For now, I can only develop Android Apps using Flutter, that's because I don't own a MacBook right now so can't test or debug apps for iOS. Hopefully this missing piece will be filled soon :)",
//   "Although I'm mainly a flutter developer but I do care about the UI/UX for my client. Hence, I also do UI designing for applications. So, feel free to ask me for getting you UI/UX for your apps",
//   "Having a startup idea? Or maybe just want a prototype for your clients? With Flutter I can get you basic version of your app in no time and you are good to go for your project in future.",
//   "I have been writing technical blogs on Medium for over a year now. So, I can get you technical blogs with awesome header images with interesting topics.\nMy Medium profile @mhamzadev",
//   "Working as open source contributor on GitHub with 200+ stars and numerous forks on various projects liked and shared by other developers.\nMy GitHub Profile @mhmzdev",
// ];

final kServicesDescriptions = [
  "Android app development via Flutter\n- Splash Screen\n- Firebase Auth/Cloud\n- REST APIs\n- Maps integration and more...!",
  "Modern UI/UX Designing\n- Adobe XD\n- Mobile & Web designs\n- Interactive UI designs\n- Responsiveness\n- Promo Videos and more..!",
  "Rapid Prototype via Flutter\n- Working MVP\n- Quick & Working prototype",
  "Technical Blog writing\n- Medium blogs\n- Soothing header images\n- SEO friendly\n- Researched topics and more..!",
  "Open source GitHub Projects\n- Awesome README.md\n- Well documented\n- Header images and more...!",
];

final kServicesLinks = [
  "",
  "",
  "",
  "",
  ""
];

// projects
final kProjectsBanner = [
  "assets/portf_icons/att_org.PNG",
  "assets/portf_icons/karobar_easy.PNG",
  "assets/portf_icons/sabzi.PNG",
  "assets/portf_icons/sabzi_rider.PNG",
  "assets/portf_icons/smart_attence.PNG",
  // "assets/projects/quranB.png",
  // "assets/projects/hereiamB.png",
  // "assets/projects/covidB.png",
];

final kProjectsIcons = [
  "assets/portf_icons/att_org.PNG",
  "assets/portf_icons/karobar_easy.PNG",
  "assets/portf_icons/sabzi.PNG",
  "assets/portf_icons/sabzi_rider.PNG",
  "assets/portf_icons/smart_attence.PNG",
  // "assets/projects/flutter.png",
  // "assets/projects/earbender.png",
  // "assets/projects/java.png",
  // "assets/projects/android.png",
  // "assets/services/open.png",
];

final kProjectsTitles = [
  "Attendance Org",
  "Karobar Easy",
  "Sabzi Shop",
  "Sabzi Shop Rider ",
  "Samrt Attendance",
  // "flutter.dev - Flutter Web",
  // "Earbender",
  // "File Transfer Protocol",
  // "My Order",
  // "Hidev",
];

final kProjectsDescriptions = [
  "Smart Attendance Org is organization side app in employee can mark attendance and submit applications(break and leave).",
  "Application of Karobar Easy is perfectly developed to maintain mobile shops.",
  "Sabzi Shop is customer side app where he can order groceries and that wll be delivered by rider",
  "Sabzi Shop Rider is Rider side app who will receive and deliver orders ",
  "Smart Attendance is for remote employee who can perform different operations like check-in, check-out and applications leave",
  // "Flutter Official Site clone using Flutter Web. Try the live site here. For the time being its not responsive fully so there might be responsiveness issues.",
  // "A concept of Music App developed using Flutter. Having functionality of playing Audio.",
  // "A simple GUI based Java application that sends file from Client to Server but not the other way around.",
  // "A concept app for self-services at various restaurants now a days. More like a Restaurant Ordering System.",
  // "Its my end semester project. The whole design I developed here is an inspiration from my favortie Flutter Developer Marcin Szałek and his blog Fidev."
];

final kProjectsLinks = [
  "https://play.google.com/store/apps/details?id=com.sbsattendanceorganization.attendance_org",
  "https://play.google.com/store/apps/details?id=com.sbs.yousafmobile",
  "https://play.google.com/store/apps/details?id=com.sbs.sabzishop",
  "https://play.google.com/store/apps/details?id=com.sbs.riderapp",
  "https://play.google.com/store/apps/details?id=com.sbs.attendance",
  // "https://github.com/mhmzdev/flutter.dev-Flutter-Web-Clone",
  // "https://github.com/mhmzdev/Earbender_Music_App",
  // "https://github.com/mhmzdev/FTP_GUI_Java",
  // "https://github.com/mhmzdev/My-Order-Resturant-Ordering-System",
  // "https://github.com/mhmzdev/Hidev_Web",
];

// Contact
final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final kContactTitles = [
  "Location",
  "Phone",
  "Email",
];

final kContactDetails = [
  "Rawalpindi, Pakistan",
  "(+92) 334 9464953",
  "hanankhanajk@gmail.com"
];
