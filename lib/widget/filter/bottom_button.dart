
import 'package:app_casynet/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({Key? key}) : super(key: key);

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
                              Text("Thiết lập lại")
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                              primary: kYellowColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                          ),
                          onPressed: () {
                            Get.find<FilterController>().distints_active.clear();
                            Get.find<FilterController>().categories_active.clear();
                            Get.find<FilterController>().display.value = "Danh sách";
                            Get.find<FilterController>().attr.value = "Mới nhất";
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
                              Text("Áp dụng")
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: kYellowColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                          ),
                          onPressed: () {
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
