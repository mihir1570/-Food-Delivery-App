import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/custom_loader.dart';
import 'package:flutter_app/base/show_custome_snackbar.dart';
import 'package:flutter_app/controllers/auth_controller.dart';
import 'package:flutter_app/models/signup_body_model.dart';
import 'package:flutter_app/utils/dimensions.dart';
import 'package:flutter_app/widgets/app_text_field.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController){

      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Please enter your name to proceed", title: "Name Required");
      }else if(phone.isEmpty){
        showCustomSnackBar("Please enter your phone number to proceed", title: "Phone Number Required");
      }else if(email.isEmpty){
        showCustomSnackBar("Please enter your email address to proceed", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Please make sure to enter a valid email address", title: "Invalid Email");
      }else if(password.isEmpty){
        showCustomSnackBar("Please enter a password to proceed", title: "Password Required");
      }else if(password.length<6){
        showCustomSnackBar("Your password must be at least 6 characters long. Please choose a stronger password", title: "Password Length");

      }else{
        showCustomSnackBar("Success! Registration Complete. Thank you for registering with us", title: "Success");
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading? SingleChildScrollView(
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

              //your phone number
              AppTextField(textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(height: Dimensions.height20,),
              //your password
              AppTextField(textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password_sharp, isObscure:true,),
              SizedBox(height: Dimensions.height20,),
              //your name
              AppTextField(textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20,),
              //your email
              AppTextField(textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(height: Dimensions.height20+Dimensions.height20,),

              // signup button
              GestureDetector(
                onTap:(){
                  _registration(_authController);
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
                      text: "Sign up",
                      size: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              //tag line
              RichText(

                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    )
                ),
              ),

              SizedBox(height: Dimensions.screenHeight*0.05,),
              //signup options
              RichText(
                text: TextSpan(
                    text: "Sign up using one of the following method",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16,
                    )
                ),
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius30,
                    backgroundImage: AssetImage(
                        "assets/image/"+signUpImages[index]
                    ),
                  ),
                )),
              )

            ],
          ),
        ):const CustomLoader();
      })
    );

  }
}
