
import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/filter_controller.dart';

class DisplayProductWidget extends StatefulWidget {
  const DisplayProductWidget({Key? key}) : super(key: key);

  @override
  State<DisplayProductWidget> createState() => _DisplayProductWidgetState();
}

class _DisplayProductWidgetState extends State<DisplayProductWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> _displays = [
      "Danh sách", "Dạng lưới", "Bản đồ",
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
                  Text("Hiển thị",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        if(Get.find<FilterController>().more_display.value){
                          Get.find<FilterController>().expandDisplayController.reverse();
                          Get.find<FilterController>().more_display.value = !Get.find<FilterController>().more_display.value;
                        }
                        else{
                          Get.find<FilterController>().expandDisplayController.forward();
                          Get.find<FilterController>().more_display.value = !Get.find<FilterController>().more_display.value;
                        }
                      });
                    },
                    iconSize: 20,
                    icon: Obx(()=>Icon(Get.find<FilterController>().more_display.value ?Icons.keyboard_arrow_up_outlined: Icons.keyboard_arrow_down_outlined))
                  )
                ],
              ),
            ),

           SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: Get.find<FilterController>().animationDisplay,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _displays.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_displays[index]),
                        Obx(()=> Radio(
                          activeColor: kYellowColor,
                          value: _displays[index],
                            onChanged: (value){
                              Get.find<FilterController>().display.value = _displays[index];
                            },
                            groupValue: Get.find<FilterController>().display.value,
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
