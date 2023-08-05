import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsModel {
  String id;
  String title;
  String appStoreUrl;

  String description;

  String gitUrl;

  Uint8List logo;

  String otherInfo;

  String playStoreUrl;

  String technicalInfo;

  String timestamp;

  // List<Uint8List> screenshots;

  ProjectsModel({
    this.id,
    this.title,
    this.appStoreUrl,
    this.description,
    this.gitUrl,
    this.logo,
    this.otherInfo,
    this.playStoreUrl,
    this.technicalInfo,
    this.timestamp,
    // this.screenshots,
  });

  ProjectsModel.fromFirestore(DocumentSnapshot doc ) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    id=data['id'];
    title= data['title'];
    appStoreUrl = data['appstore_url'];
    description = data['description'];
    gitUrl = data['github_url'];
    logo = base64Decode(data['logo']);
    otherInfo = data['other_info'];
    playStoreUrl = data['playstore_url'];
    technicalInfo = data['technical_indo'];
    timestamp=data['time_stamp'].toString();
    // if(data["screens"]!= null){
    //   List<String> temp = <String>[];
    //   screenshots = <Uint8List>[];
    //   data["screens"].forEach((value){
    //     temp.add(value);
    //   });
    //   print(temp);
    //   temp.map((e) => screenshots.add(base64Decode(e)));
    //   print(screenshots);
    // }
    // screenshots=data['is_selected'];
  }

}

 class ProjectImagesModel{
   String id;
   String parentId;
   Uint8List image;

   ProjectImagesModel({this.id, this.parentId, this.image});

   ProjectImagesModel.fromFirestore(DocumentSnapshot doc ) {
     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
     id=data['id'];
     parentId=data['parent_id'];
     image=base64Decode(data['image']);


     // screenshots=data['is_selected'];
   }
}
