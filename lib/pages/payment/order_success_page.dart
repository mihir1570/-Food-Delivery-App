import 'package:flutter/material.dart';
import 'package:flutter_app/base/custom_button.dart';
import 'package:flutter_app/routes/route_helper.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/dimensions.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderID;
  final int status;
  OrderSuccessPage({super.key, required this.orderID, required this.status});

  @override
  Widget build(BuildContext context) {
    if(status==0) {
      Future.delayed(Duration(seconds: 1), () {
        // Get.dialog(PaymentFaileDialog(orderID: orderID), barrierDismissible: false);
      });
    }
    return Scaffold(
      body: Center(child: SizedBox(width: Dimensions.screenWidth, child:
        Column( mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(status == 1 ? Icons.check_circle_outline: Icons.warning_amber_outlined,
          size: 100, color: AppColors.mainColor,
          ),
          SizedBox(height: Dimensions.height30,),

          Text(
            status == 1 ? 'You placed the order successfully' : 'Your order failed',
            style: TextStyle(fontSize: Dimensions.font20),
          ),
          SizedBox(height: Dimensions.height20,),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height20,
              vertical: Dimensions.height10),
            child: Text(
              status == 1 ? 'Successful order' : 'Failed order ',
              style: TextStyle(fontSize: Dimensions.font20,
              color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: Dimensions.height10,),

          Padding(
              padding: EdgeInsets.all(Dimensions.height10),
            child: CustomButton(buttonText: 'Back to home', onPressed:
            () => Get.offAllNamed(RouteHelper.getInitial())),
          ),
        ],),),),
    );
  }
}
