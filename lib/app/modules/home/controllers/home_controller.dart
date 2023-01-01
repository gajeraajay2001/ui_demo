import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:ui_task/app/constants/sizeConstant.dart';

import '../../../model/data_response_model.dart';

class HomeController extends GetxController {
  DataModel dataModel = DataModel();
  RxBool hasData = false.obs;
  Rx<MatchEngine>? matchEngine;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDataFromJson();
      fillSwipeCards();
    });
    super.onInit();
  }

  getDataFromJson() async {
    String data = await rootBundle.loadString("assets/property.json");
    Map<String, dynamic> mapData = jsonDecode(data);
    dataModel = DataModel.fromJson(mapData);
    hasData.value = true;
  }

  fillSwipeCards() {
    List<SwipeItem> swipeItems = [];
    if (!isNullEmptyOrFalse(dataModel.data!.properties)) {
      dataModel.data!.properties!.forEach((element) {
        swipeItems.add(SwipeItem(
          content: element.id,
        ));
      });
    }
    matchEngine = MatchEngine(swipeItems: swipeItems).obs;
    matchEngine!.refresh();
    HomeController().refresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
