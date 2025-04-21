// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/app/data/categorie_response.dart';
// import 'package:myapp/app/data/detail_event_response.dart';
// import 'package:myapp/app/data/event_response.dart';
import 'package:myapp/app/data/information_response.dart';
import 'package:myapp/app/modules/dashboard/views/categorie_view.dart';
import 'package:myapp/app/modules/dashboard/views/profile_view.dart';
import 'package:myapp/app/modules/dashboard/views/information_view.dart';
import 'package:myapp/app/utils/api.dart';

// import 'package:myapp/app/modules/dashboard/views/index_view.dart';
// import 'package:myapp/app/modules/dashboard/views/your_event_view.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;
  final _getConnect = GetConnect();

  final token = GetStorage().read('access_token');

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    // IndexView(),
    // YourEventView(),
    InformationView(),
    CategorieView(),
    ProfileView(),
  ];


  // GET INFORMATION
  Future<InformationResponse> getInformation() async {
    final response = await _getConnect.get(
      BaseUrl.information,
      headers: {'Authorization': 'Bearer $token'},
      contentType: 'application/json',
    );
    return InformationResponse.fromJson(response.body);
  }

// GET INFORMATION
  Future<CategorieResponse> getCategorie() async {
    final response = await _getConnect.get(
      BaseUrl.categorie,
      headers: {'Authorization': 'Bearer $token'},
      contentType: 'application/json',
    );
    return CategorieResponse.fromJson(response.body);
  }

  @override
  void onInit() {
    // getEvent();
    // getYourEvent();
    
    getInformation();
    getCategorie();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
