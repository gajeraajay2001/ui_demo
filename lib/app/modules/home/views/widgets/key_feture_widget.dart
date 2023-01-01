import 'package:flutter/material.dart';
import 'package:ui_task/app/model/data_response_model.dart';

import '../../../../constants/sizeConstant.dart';
import '../../../../theme/theme_helper.dart';

class KeyAndFeatureWidget extends StatelessWidget {
  List<KeyFeatures> keyFeatureList = [];
  KeyAndFeatureWidget({required this.keyFeatureList});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Key feature & amenities",
          style: appTheme.getTitleTextStyle,
        ),
        Spacing.height(15),
        Container(
          height: MySize.getHeight(100),
          // width: MySize.getWidth(100),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: MySize.getHeight(100),
                  width: MySize.getWidth(100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MySize.getHeight(20)),
                    border: Border.all(color: appTheme.primaryColor),
                  ),
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: MySize.getWidth(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getImageByLink(
                        url: keyFeatureList[index].colorIconUrl.toString(),
                        height: MySize.getHeight(45),
                        width: MySize.getWidth(45),
                      ),
                      Spacing.height(15),
                      Text(
                        keyFeatureList[index].name.toString(),
                        style: appTheme.getNormalBlackTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: MySize.getWidth(10),
                );
              },
              itemCount: keyFeatureList.length),
        ),
      ],
    );
  }
}
