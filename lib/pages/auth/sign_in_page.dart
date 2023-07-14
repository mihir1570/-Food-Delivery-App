import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/custom_loader.dart';
import 'package:flutter_app/pages/auth/sign_up_page.dart';
import 'package:flutter_app/routes/route_helper.dart';
import 'package:flutter_app/utils/dimensions.dart';
import 'package:flutter_app/widgets/app_text_field.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custome_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController){

      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if(phone.isEmpty){
        showCustomSnackBar("Please enter your phone number to proceed", title: "Phone number");
      }else if(!GetUtils.isPhoneNumber(phone)){
        showCustomSnackBar("Please make sure to enter a valid phone number", title: "Invalid phone number");
      }else if(password.isEmpty){
        showCustomSnackBar("Please enter a password to proceed", title: "Password Required");
      }else{

        authController.login(phone, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            // showCustomSnackBar(status.message);
            showCustomSnackBar("Incorrect phone number or password please check again",title: "Invalid credentials");
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              //app logo
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(
                        "assets/image/logo part 1.png"
                    ),
                  ),
                ),
              ),
              //welcome
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font26*3+Dimensions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              //your email
              AppTextField(textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(height: Dimensions.height20,),
              //your password
              AppTextField(textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp, isObscure: true,),
              SizedBox(height: Dimensions.height20,),
              //tag line
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(

                    text: TextSpan(
                        text: "sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        )
                    ),
                  ),
                  SizedBox(width: Dimensions.width20,),
                ],
              ),

              SizedBox(height: Dimensions.screenHeight*0.05,),

              // sign in button
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign in",
                      size: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),

              //signup options
              RichText(
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                          text: " Create",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlackColor,
                            fontSize: Dimensions.font20,
                          )),
                    ]
                ),
              ),

            ],
          ),
        ):CustomLoader();
      })
    );
  }
}
