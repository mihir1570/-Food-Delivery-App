import 'package:flutter/material.dart';
import 'package:flutter_app/base/custom_app_bar.dart';
import 'package:flutter_app/base/custom_loader.dart';
import 'package:flutter_app/controllers/auth_controller.dart';
import 'package:flutter_app/controllers/cart_controller.dart';
import 'package:flutter_app/controllers/location_controller.dart';
import 'package:flutter_app/controllers/user_controller.dart';
import 'package:flutter_app/routes/route_helper.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/dimensions.dart';
import 'package:flutter_app/widgets/account_widget.dart';
import 'package:flutter_app/widgets/app_icon.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      Get.find<LocationController>().getAddressList();
      print("user login");
    }
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?
        (userController.isLoading?Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(

            children: [
              //profile icon
              AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height15*5,
                size: Dimensions.height15*10,),
              SizedBox(height: Dimensions.height30,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,),

                          bigText: BigText(text: userController.userModel!.name)
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //phone
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.phone,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,),

                          bigText: BigText(text: userController.userModel!.phone)
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //email
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.email,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,),

                          bigText: BigText(text: userController.userModel!.email)
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //address
                      GetBuilder<LocationController>(builder: (locationController){
                        if(_userLoggedIn&&locationController.addressList.isEmpty){
                          return GestureDetector(
                            onTap: (){
                              Get.offNamed(RouteHelper.getAddressPage());
                            },
                            child: AccountWidget(
                                appIcon: AppIcon(icon: Icons.location_on,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,),

                                bigText: BigText(text: "Fill in your address",)
                            ),
                          );
                        }else{
                          return GestureDetector(
                            onTap: (){
                              Get.offNamed(RouteHelper.getAddressPage());
                            },
                            child: AccountWidget(
                                appIcon: AppIcon(icon: Icons.location_on,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,),

                                bigText: BigText(text: "Your address",)
                            ),
                          );
                        }
                      }),
                      SizedBox(height: Dimensions.height20,),
                      //message
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.message_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,),

                          bigText: BigText(text: "Messages",)
                      ),
                      SizedBox(height: Dimensions.height20,),

                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.find<LocationController>().clearAddressList();
                            Get.offNamed(RouteHelper.getSignInPage());
                          }else{
                            print("you logout");
                          }
                        },
                        child: AccountWidget(
                            appIcon: AppIcon(icon: Icons.logout,
                              backgroundColor: Colors.redAccent,
                              iconColor: Colors.white,
                              iconSize: Dimensions.height10*5/2,
                              size: Dimensions.height10*5,),

                            bigText: BigText(text: "Logout",)
                        ),
                      ),
                      SizedBox(height: Dimensions.height20,),


                    ],
                  ),
                ),
              )

            ],
          ),
        ):
        CustomLoader()):
        Container(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height20*9,
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20 ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/image/signintocontinue.png",
                      ),
                  ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getSignInPage());
              },
              child: Container(

                width: double.maxFinite,
                height: Dimensions.height20*5,
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20 ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Center(child: BigText(text: "Sign in", color: Colors.white, size: Dimensions.font26,)),
              ),
            ),
          ],
        )));
      }),
    );
  }
}
