
import 'package:app_casynet/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../containts/colors.dart';

class OriginProductWidget extends StatelessWidget {
  const OriginProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _countrys = [
      'Mỹ', 'Việt Nam', 'Trung Quốc', 'Nhật Bản', 'Thái Lan', 'Thụy Điển'
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
                  Text("Xuất sứ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        if(Get.find<FilterOriginController>().more_origin.value){
                          Get.find<FilterOriginController>().more_origin.value = !Get.find<FilterOriginController>().more_origin.value;
                          Get.find<FilterOriginController>().expandOriginController.reverse();
                        }
                        else{
                          Get.find<FilterOriginController>().more_origin.value = !Get.find<FilterOriginController>().more_origin.value;
                          Get.find<FilterOriginController>().expandOriginController.forward();
                        }
                      },
                      iconSize: 20,
                      icon: Obx(()=>Icon(
                          Get.find<FilterOriginController>().more_origin.value ?
                          Icons.keyboard_arrow_up_outlined:
                          Icons.keyboard_arrow_down_outlined)
                      )
                  )
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: Get.find<FilterOriginController>().animationOrigin,
              child: Container(
                  width: double.infinity,
                  child: Obx(()=>Wrap(
                    children: _countrys.map((e){
                      bool isContain = Get.find<FilterOriginController>().isContain(e);
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(
                              child: Row(
                                children: [
                                  Text(e,
                                    style: TextStyle(
                                        color: isContain ? Colors.white : kTextColor
                                    ),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: isContain ? kYellowColor: Colors.white,
                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        width: 1,
                                        color: Get.find<FilterOriginController>().isContain(e) ? kYellowColor: kTextColor
                                    ),
                                  )
                              ), onPressed: () {
                              Get.find<FilterOriginController>().change_list(e);
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
