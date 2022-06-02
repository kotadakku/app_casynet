
import 'package:app_casynet/app/controller/cart/api/product_cart_controller.dart';
import 'package:app_casynet/app/controller/product_detail/detail_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';



class TagsProductWidget extends StatelessWidget {
  final DetailProductController controller;
  const TagsProductWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          padding: EdgeInsets.only(top: 15.h, left: 10.w),
          width: double.infinity,
          child: Text("Tags",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

        ),
        Divider(
          height: 20,
          color: AppColors.textGrayColor,
        ),
        if(controller.product.value.tags != null)
        Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            child: Wrap(
              spacing: 5.0.w,
              children:  controller.product.value.tags!.map((e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: OutlinedButton(
                      child: Row(
                        children: [
                          Text(e)
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: AppColors.textGrayColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ), onPressed: () {  },
                    ),
                  )
                ],
              )).toList(),
            )
        )
      ],
    );
  }
}
