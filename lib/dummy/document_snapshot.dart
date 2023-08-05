import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_web_v2/controller/db_controller.dart';
import 'package:portfolio_web_v2/sections/home/homeDesktop.dart';
import 'package:portfolio_web_v2/sections/home/homeMobile.dart';
import 'package:portfolio_web_v2/sections/home/homeTab.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyDataWidget extends StatelessWidget {
  var controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
          body: Center(
        child: Text("homeMobile"),
      )),
      tablet: Scaffold(
          body: Center(
        child: Text("home tab"),
      )),
      desktop: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Obx(() => controller.isLoading.value
                ? CircularProgressIndicator(
                    color: Colors.black,
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            "controller.dataList[index].title",
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            "controller.dataList[index].timestamp",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    })),
          ),
        ),
      )),
    );
  }
}

// Widget build(BuildContext context) {
//   return Scaffold(
//     body : StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('my_collection').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         // If the connection is done and no errors, display the data
//         final documents = snapshot.data.docs;
//         return ListView.builder(
//           itemCount: documents.length,
//           itemBuilder: (context, index) {
//             // Access your document fields like this:
//             final data = documents[index].data() as Map<String, dynamic>;
//             final name = data['title'];
//
//             return ListTile(
//               title: Text(name,style: TextStyle(color: Colors.blueGrey),),
//             );
//           },
//         );
//       },
//     ),
//   );
// }
