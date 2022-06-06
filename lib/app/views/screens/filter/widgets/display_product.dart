
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/filter/filter_product_controller.dart';
import '../../../theme/app_colors.dart';
class DisplayProductWidget extends StatefulWidget {
  const DisplayProductWidget({Key? key}) : super(key: key);

  @override
  State<DisplayProductWidget> createState() => _DisplayProductWidgetState();
}

class _DisplayProductWidgetState extends State<DisplayProductWidget> {
  FilterDisplayController controller = Get.find<FilterDisplayController>();
  @override
  Widget build(BuildContext context) {
    List<String> _displays = [
      "Danh sách", "Dạng lưới", "Bản đồ",
    ];

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('display'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        controller.expand();
                      });
                    },
                      iconSize: 20,
                    icon: AnimatedBuilder(
                      animation: controller.expandDisplayController,
                      builder: (context, child){
                        return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                      },
                    )
                  )
                ],
              ),
            ),

           SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: controller.animationDisplay,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _displays.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(_displays[index]),
                        ),
                        Obx(()=> Radio(
                          activeColor: AppColors.yellowColor,
                          value: _displays[index],
                            onChanged: (value){
                              controller.display.value = _displays[index];
                            },
                            groupValue: controller.display.value,
                        ),)
                      ],
                    );
                  }
              ),)
          ],
        )
    );
  }
}
