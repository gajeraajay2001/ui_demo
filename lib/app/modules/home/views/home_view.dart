import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:ui_task/app/constants/sizeConstant.dart';
import 'package:ui_task/app/modules/home/views/widgets/card_view_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: (controller.hasData.isTrue)
              ? Container(
                  height: MySize.safeHeight,
                  width: MySize.safeWidth,
                  child: SwipeCards(
                    fillSpace: true,
                    matchEngine: controller.matchEngine!.value,
                    upSwipeAllowed: false,
                    onStackFinished: () {
                      controller.fillSwipeCards();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));
                    },
                    itemBuilder: (context, index) {
                      return CardViewWidget(
                          controller: controller,
                          properties:
                              controller.dataModel.data!.properties![index]);
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
