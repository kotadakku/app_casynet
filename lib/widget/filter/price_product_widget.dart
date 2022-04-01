
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../containts/colors.dart';
import '../../controller/filter_controller.dart';

class PriceProductWidget extends StatelessWidget {
  const PriceProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Theo giá",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.find<FilterPriceController>().expand();
                      },
                      iconSize: 20,
                      icon: Obx(()=>Icon( Get.find<FilterPriceController>().more_price.value? Icons.keyboard_arrow_down_outlined: Icons.keyboard_arrow_up_outlined))
                  )
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: Get.find<FilterPriceController>().animationPrice,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Obx((){
                        bool is_high_price = Get.find<FilterPriceController>().is_high_price.value;
                        return Row(
                          children: [
                            ElevatedButton(
                              child: Text("Giá cao",
                                style: TextStyle(
                                  color: is_high_price ? Colors.white: kTextColor
                                 ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: is_high_price ? kYellowColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    width: 1,
                                    color: is_high_price ? kYellowColor: kTextColor
                                  )
                                  )
                              ), onPressed: () {
                                  Get.find<FilterPriceController>().is_high_price.value = ! is_high_price;
                              },
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              child: Text(
                                "Giá thấp",
                                style: TextStyle(
                                color: !is_high_price ? Colors.white: kTextColor
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: is_high_price ? Colors.white : kYellowColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                side: BorderSide(
                                  width: 1,
                                  color: !is_high_price ? kYellowColor: kTextColor
                                )
                              ),
                              onPressed: () {
                                Get.find<FilterPriceController>().is_high_price.value = ! is_high_price;
                              },
                            ),
                          ],
                        );
                      })
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              const Text("Từ "),

                              Container(
                                width: 100,
                                height: 30,
                                child: Obx(()=>
                                  TextFormField(
                                    controller: Get.find<FilterPriceController>().price_min_text,
                                    cursorColor: kYellowColor,
                                    keyboardType: TextInputType.number,

                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: kTextColor_gray
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return 'Trống';
                                      }
                                      final number = int.tryParse(value);
                                      if(number == null){
                                        return 'Không đúng định dạng';
                                      }
                                      return null;
                                    },

                                    onChanged: (value){
                                      Get.find<FilterPriceController>().validate_min(value);
                                    },
                                    decoration: InputDecoration(
                                      errorText: Get.find<FilterPriceController>().price_min_error.value!=""? Get.find<FilterPriceController>().price_min_error.value:null,
                                      errorStyle: TextStyle(
                                        fontSize: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(5.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kYellowColor, width: 1.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                                      ),
                                    )
                                )),
                              ),
                            ],
                          )
                      ),
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              const Text("Đến "),
                              Container(
                                width: 100,
                                height: 30,
                                child: Obx(()=>
                                  TextFormField(
                                    cursorColor: kYellowColor,
                                    keyboardType: TextInputType.number,
                                    controller:  Get.find<FilterPriceController>().price_max_text,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: kTextColor_gray
                                    ),
                                    decoration: InputDecoration(
                                      errorText: Get.find<FilterPriceController>().price_max_error.value!=""? Get.find<FilterPriceController>().price_max_error.value:null,
                                      errorStyle: TextStyle(
                                        fontSize: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(5.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kYellowColor, width: 1.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                                      ),
                                    ),
                                    onChanged: (value){
                                      Get.find<FilterPriceController>().validate_max(value);
                                    },
                                  )
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
