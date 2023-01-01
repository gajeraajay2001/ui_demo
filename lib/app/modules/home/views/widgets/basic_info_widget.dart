import 'package:flutter/material.dart';
import 'package:ui_task/app/model/data_response_model.dart';
import 'package:ui_task/app/utilities/utilities.dart';
import '../../../../constants/sizeConstant.dart';
import '../../../../theme/theme_helper.dart';

class BasicInfoWidget extends StatelessWidget {
  Properties properties = Properties();
  BasicInfoWidget({required this.properties});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic Info",
            style: appTheme.getTitleTextStyle,
          ),
          Spacing.height(15),
          getRowWidget(
              title: "Listing Type",
              text: getPropertyListingType(
                  type: properties.listingType.toString())),
          getRowWidget(
              title: "Property Type",
              text: getPropertyType(type: properties.propertyType.toString())),
          getRowWidget(
              title: "Room Type",
              text: getRoomType(type: properties.roomType.toString())),
          getRowWidget(
              title: "Move in date",
              text: getMoveInDate(type: properties.moveInDate.toString())),
          getRowWidget(
              title: "Length of stay",
              text: getLengthOfStay(type: properties.lengthOfStay.toString())),
          getRowWidget(
              title: "Type", text: getType(type: properties.type.toString())),
          getRowWidget(
              title: "For Students",
              text: getIsForStudents(
                  type: properties.isSuitableForStudent.toString())),
          getRowWidget(
              title: "Deposit amount",
              text: properties.depositAmount.toString()),
        ],
      ),
    );
  }

  Widget getRowWidget({required String title, required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: MySize.getHeight(10)),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: appTheme.getNormalGreyTextStyle,
            ),
          ),
          Expanded(
            flex: 9,
            child: Text(
              text,
              style: appTheme.getNormalBlackTextStyle
                  .copyWith(fontSize: MySize.getHeight(14)),
            ),
          ),
        ],
      ),
    );
  }
}
