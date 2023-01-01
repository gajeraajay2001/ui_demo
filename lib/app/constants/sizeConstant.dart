import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late bool isMini;
  static double? safeWidth;
  static double? safeHeight;

  static late double scaleFactorWidth;
  static late double scaleFactorHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    isMini = _mediaQueryData.size.height < 750;
    double _safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double _safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    scaleFactorHeight = (safeHeight! / 748);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }

    scaleFactorWidth = (safeWidth! / 360);

    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }
  }

  static double getWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getHeight(double size) {
    return (size * scaleFactorHeight);
  }
}

class Spacing {
  static Widget height(double height) {
    return SizedBox(
      height: MySize.getHeight(height),
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: MySize.getWidth(width),
    );
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

getSnackBar(
    {required BuildContext context,
    String text = "",
    double size = 16,
    int duration = 500}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(fontSize: MySize.getHeight(size))),
      duration: Duration(milliseconds: duration),
    ),
  );
}

getGetXSnackBar({String title = "", String msg = ""}) {
  return Get.snackbar(
    title,
    msg,
    snackPosition: SnackPosition.BOTTOM,
  );
}

CachedNetworkImage getImageByLink(
    {required String url,
    required double height,
    required double width,
    bool isLoading = false,
    bool colorFilter = false,
    String imagePlaceHolder = "dog_placeholder.jpeg",
    BoxFit boxFit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: MySize.getHeight(height),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
          colorFilter: (colorFilter)
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken)
              : null,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: height,
      width: width,
      child: Image.network(
          "https://removal.ai/wp-content/uploads/2021/02/no-img.png"),
    ),
    errorWidget: (context, url, error) => Image(
        image: NetworkImage(
            "https://www.acresninches.com/images/1575881519_paramountgroup.jpg"),
        height: height,
        fit: boxFit),
  );
}
