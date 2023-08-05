import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_web_v2/model/projects_model.dart';
import 'package:get/get.dart';

class DbController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool loadingProject = false.obs;
  List<ProjectsModel> projects;
  List<ProjectImagesModel> projectImages = <ProjectImagesModel>[];

  final CollectionReference _dataCollection = FirebaseFirestore.instance.collection('my_collection');

  @override
  void onInit(){
    fetchData();
    super.onInit();
  }

  Future<List<ProjectsModel>> fetchData() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot = await _dataCollection.get();
       projects = querySnapshot.docs.map((doc) => ProjectsModel.fromFirestore(doc)).toList();
       isLoading.value = false;
      return projects;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching data: $e');
      return [];
    }}

  fetchProjectImages(String projectId) async {
    loadingProject.value = true;
    try {
      QuerySnapshot querySnapshot = await _dataCollection.doc(projectId).collection("screens").get();
      projectImages = querySnapshot.docs.map((doc) => ProjectImagesModel.fromFirestore(doc)).toList();
      loadingProject.value = false;
      return projects;
    } catch (e) {
      loadingProject.value = false;
      print('Error fetching data: $e');
      return [];
    }}
}