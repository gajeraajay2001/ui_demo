import 'package:flutter/material.dart';
import 'package:ui_task/app/model/data_response_model.dart';

import '../../../../constants/sizeConstant.dart';
import '../../../../theme/theme_helper.dart';

class MainImageViewWidget extends StatelessWidget {
  Properties properties = Properties();
  MainImageViewWidget({required this.properties});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        MySize.getHeight(20),
      ),
      child: Stack(
        children: [
          getImageByLink(
            url: properties.propertyImages![0].path.toString(),
            height: MySize.safeHeight! + MySize.getHeight(3),
            width: MySize.safeWidth!,
            boxFit: BoxFit.cover,
          ),
          Container(
            height: MySize.safeHeight! + MySize.getHeight(3),
            width: MySize.safeWidth!,
            padding: EdgeInsets.symmetric(
                horizontal: MySize.getWidth(20),
                vertical: MySize.getHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          properties.addressArea.toString(),
                          style: appTheme.getWhiteTextStyle
                              .copyWith(fontSize: MySize.getHeight(25)),
                        ),
                        Spacing.height(10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(
                              MySize.getHeight(5),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: MySize.getHeight(5),
                              horizontal: MySize.getWidth(8)),
                          child: Text(
                            properties.status.toString(),
                            style: appTheme.getWhiteTextStyle.copyWith(
                                fontSize: MySize.getHeight(11),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100000),
                      child: Container(
                        height: MySize.getHeight(42),
                        width: MySize.getWidth(42),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: getImageByLink(
                            url: properties.user!.profileImage.toString(),
                            height: MySize.getHeight(42),
                            width: MySize.getWidth(42),
                            boxFit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "₤${properties.monthlyPrice}",
                  style: appTheme.getWhiteTextStyle.copyWith(
                      fontSize: MySize.getHeight(28),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900),
                ),
                Spacing.height(10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: MySize.getHeight(5),
                  children: [
                    Icon(
                      Icons.bed,
                      color: appTheme.primaryColor,
                      size: MySize.getHeight(18),
                    ),
                    Spacing.width(8),
                    Text(
                      "${properties.bedrooms}",
                      style: appTheme.getWhiteTextStyle.copyWith(
                          fontSize: MySize.getHeight(14),
                          fontWeight: FontWeight.normal),
                    ),
                    Spacing.width(10),
                    Icon(
                      Icons.bathtub,
                      color: Colors.blue,
                      size: MySize.getHeight(18),
                    ),
                    Spacing.width(8),
                    Text(
                      "${properties.bedrooms}",
                      style: appTheme.getWhiteTextStyle.copyWith(
                          fontSize: MySize.getHeight(14),
                          fontWeight: FontWeight.normal),
                    ),
                    Spacing.width(8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: MySize.getHeight(5),
                      width: MySize.getWidth(5),
                    ),
                    Spacing.width(8),
                    Text(
                      "${properties.nearestLocation}",
                      style: appTheme.getWhiteTextStyle.copyWith(
                          fontSize: MySize.getHeight(14),
                          fontWeight: FontWeight.normal),
                    ),
                    Spacing.width(8),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_run,
                          color: Colors.red,
                          size: MySize.getHeight(18),
                        ),
                        Spacing.width(5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          height: MySize.getHeight(5),
                          width: MySize.getWidth(5),
                        ),
                        Spacing.width(5),
                        Text(
                          "${properties.nearestLocationTime}",
                          style: appTheme.getWhiteTextStyle.copyWith(
                              fontSize: MySize.getHeight(14),
                              fontWeight: FontWeight.normal),
                        ),
                        Spacing.width(8),
                      ],
                    ),
                  ],
                ),
                Spacing.height(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
