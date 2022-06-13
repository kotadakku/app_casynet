
import 'package:app_casynet/app/controller/home/api/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../controller/filter/filter_product_controller.dart';
import '../../../theme/app_colors.dart';

class BottomButtonWidget extends StatelessWidget {
  BottomButtonWidget({Key? key}) : super(key: key);
  FilterProductController _filterProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child:  Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: OutlinedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.autorenew),
                              Text('reset'.tr)
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                              primary: AppColors.yellowColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                          ),
                          onPressed: () {
                            _filterProductController.resetFilter();
                          },
                        ),
                      )
                  ),
                  Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.done),
                              Text('apply'.tr)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.yellowColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                          ),
                          onPressed: () {
                            _filterProductController.searchProduct();
                            Get.back();
                          },
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
