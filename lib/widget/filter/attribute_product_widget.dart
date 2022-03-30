
import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AttributeProductWidget extends StatelessWidget {
  AttributeProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? _attrs = [
      "Mới nhất", "Gần tôi", "Nổi bật", "Đặt nhiều", "Uy tín", "Giá thấp", "Giá cao"
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                      if(Get.find<FilterController>().more_attr.value){
                        Get.find<FilterAttrController>().expandAttrController.reverse();
                        Get.find<FilterController>().more_attr.value = !Get.find<FilterController>().more_attr.value;
                      }
                      else{
                        Get.find<FilterAttrController>().expandAttrController.forward();
                        Get.find<FilterController>().more_attr.value = !Get.find<FilterController>().more_attr.value;
                      }
                    },
                    iconSize: 20,
                    icon: Obx(()=>Icon(Get.find<FilterController>().more_attr.value ?Icons.keyboard_arrow_up_outlined: Icons.keyboard_arrow_down_outlined))
                  )
                ],
              ),
            ),
            // danh sách các thuộc tính
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: Get.find<FilterAttrController>().animationAttr,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _attrs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_attrs[index]),
                        Obx(()=>Radio(
                          value: _attrs[index],
                          activeColor: kYellowColor,
                          onChanged: (value){
                            Get.find<FilterController>().attr.value = _attrs[index];
                          },
                          groupValue: Get.find<FilterController>().attr.value,),)
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
