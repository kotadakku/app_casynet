
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/filter/filter_product_controller.dart';
import '../../../../controller/home/api/origin_controller.dart';
import '../../../theme/app_colors.dart';

class OriginProductWidget extends StatelessWidget {
  const OriginProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterOriginController controller = Get.find<FilterOriginController>();
    OriginController originController = Get.find();

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('origin'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        controller.expand();
                      },
                      iconSize: 20,
                      icon: AnimatedBuilder(
                        animation: controller.animationOrigin,
                        builder: (context, child){
                          return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                        },
                      )
                  )
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: controller.animationOrigin,
              axisAlignment: 1.0,
              child: Container(
                  width: double.infinity,
                  child: Obx(()=>Wrap(
                    spacing: 5.0.w,
                    children: originController.originList.take(6).map((e){
                      bool isContain = controller.isContain(e);
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(
                              child: Row(
                                children: [
                                  Text(e.name!,
                                    style: TextStyle(
                                        color: isContain ? Colors.white : AppColors.textGrayColor
                                    ),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: isContain ? AppColors.yellowColor: Colors.white,
                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 1,
                                        color: controller.isContain(e) ? AppColors.yellowColor: AppColors.textGrayColor
                                    ),
                                  )
                              ), onPressed: () {
                              controller.change_list(e);
                            },
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ))
              ),

            )


          ],
        )
    );
  }
}
