import 'package:get/get.dart';
class Dimensions{

  //for example SM-A505f Height:876.571 and Width:411.428

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //  876/220=3.98  876/120=7.3  876/320=2.73
  static double pageView= screenHeight/2.73;
  static double pageViewContainer= screenHeight/3.98;
  static double pageViewTextContainer= screenHeight/7.3;

  // dynamic height contain padding and margin   --> 876/10=87.6  876/20=43.8  876/15=58.4
  static double height10 = screenHeight/87.6;
  static double height15 = screenHeight/58.4;
  static double height20 = screenHeight/43.8;
  static double height30 = screenHeight/29.2;
  static double height45 = screenHeight/19.46;

  // dynamic width padding and margin
  static double width10 = screenHeight/87.6;
  static double width15 = screenHeight/58.4;
  static double width20 = screenHeight/43.8;
  static double width30 = screenHeight/29.2;

  //font size
  static double font12 = screenHeight/73.04;
  static double font16 = screenHeight/54.75;
  static double font20 = screenHeight/43.8;
  static double font26 = screenHeight/33.69;

  // radius
  static double radius20 = screenHeight/43.8;
  static double radius15 = screenHeight/58.4;
  static double radius30 = screenHeight/29.2;

  // icon size
  static double iconSize24 = screenHeight/36.5;
  static double iconSize16 = screenHeight/54.75;

  // list view size
  static double listViewImgSize = screenWidth/3.42;
  static double listViewTextContSize = screenWidth/4.11;

  //popular food
  static double popularFoodImgSize = screenHeight/2.50;

  //bottom height
  static double bottomHeightBar = screenHeight/7.3;

  //splash screen dimension
  static double splashImg = screenHeight/2.70;
}