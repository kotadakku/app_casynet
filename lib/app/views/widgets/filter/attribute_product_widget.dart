
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/filter_product_controller.dart';
import '../../screens/theme/app_colors.dart';

class AttributeProductWidget extends StatelessWidget {
  final FilterAttrController controller = Get.find<FilterAttrController>();
  AttributeProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String>? _attrs = [
      "Mới nhất", "Gần tôi", "Nổi bật", "Đặt nhiều", "Uy tín", "Giá thấp", "Giá cao"
    ];
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Thuộc tính",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      controller.expand();
                    },
                    iconSize: 20,
                    icon: AnimatedBuilder(
                      animation: controller.animationAttr,
                      builder: (context, child){
                        return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                      },
                    )
                  )
                ],
              ),
            ),
            // danh sách các thuộc tính
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: controller.animationAttr,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _attrs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5.0.w),
                          child: Text(_attrs[index]),
                        ),
                        Obx(()=>Radio(
                          value: _attrs[index],
                          activeColor: kYellowColor,
                          onChanged: (value){
                            controller.attr.value = _attrs[index];
                          },
                          groupValue: controller.attr.value,),)
                      ],
                    );
                  }
              ),
            )

          ],
        )
    );
  }
}
