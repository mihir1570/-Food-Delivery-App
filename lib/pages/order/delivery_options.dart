import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/order_controller.dart';
import 'package:flutter_app/utils/dimensions.dart';
import 'package:get/get.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;
  const DeliveryOptions({super.key,
    required this.value,
    required this.title,
    required this.amount,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return Row(
        children: [
          Radio(
            onChanged: (String? value)=>orderController.setDeliveryType(value!),
            groupValue: orderController.orderType,
            value: value,
            activeColor: Theme.of(context).primaryColor,
          ),
          SizedBox(width: Dimensions.width10/2,),
          Text(title),
          SizedBox(width: Dimensions.width10/2,),
          Text(
            '(${(value== 'take away'||isFree)?'free':'\$${amount/10}'})',
          ),
        ],
      );
    });
  }
}
