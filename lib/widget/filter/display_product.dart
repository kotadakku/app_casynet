
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/filter_product_controller.dart';
import '../../theme/app_colors.dart';

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
                        Get.find<FilterDisplayController>().expand();
                      });
                    },
                    iconSize: 20,
                    icon: Obx(()=>Icon(Get.find<FilterDisplayController>().more_display.value ?Icons.keyboard_arrow_up_outlined: Icons.keyboard_arrow_down_outlined))
                  )
                ],
              ),
            ),

           SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: Get.find<FilterDisplayController>().animationDisplay,
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
                              Get.find<FilterDisplayController>().display.value = _displays[index];
                            },
                            groupValue: Get.find<FilterDisplayController>().display.value,
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
