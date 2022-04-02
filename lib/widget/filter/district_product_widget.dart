import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_colors.dart';
import '../../controller/filter_product_controller.dart';

class DistrictProductWidget extends StatelessWidget {
  const DistrictProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _districts = [
      'Quận Cầu Giấy', 'Quận Hà Đông', 'Quận Hoàn Kiếm', 'Quận Hai Bà Trưng', 'Quận Mỹ Đình'
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
                  const Text("Quận/Huyện",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/home/icon_location.svg", height: 15,),
                        const SizedBox(width: 8,),
                        const Text("Hà Nội")
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: kYellowColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                    ), onPressed: () {  },
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){

                      },
                      iconSize: 20,
                      icon: Obx(()=>Icon( Get.find<FilterDistrictController>().more_district.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined))
                  )
                ],
              ),
            ),
           SizeTransition(
             sizeFactor: Get.find<FilterDistrictController>().animationDistrict,
             child: Container(
                 width: double.infinity,
                 child: Wrap(
                   spacing: 5.0,
                   children: _districts.map((e) => Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Obx((){
                         bool isContains = Get.find<FilterDistrictController>().isContain(e);
                         return Container(
                           child: OutlinedButton(
                             child: Text(e,
                               style: TextStyle(
                                 color: isContains ? Colors.white : kTextColor,
                               ),
                             ),
                             style: ElevatedButton.styleFrom(
                                 primary: isContains ? kYellowColor : Colors.white,
                                 onPrimary: isContains ? kYellowColor : Colors.white,
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                 side: BorderSide(color: isContains ? kYellowColor : kTextColor, width: 1),
                                 elevation: 0
                             ), onPressed: () {
                             Get.find<FilterDistrictController>().change_list(e);

                           },
                           ),
                         );
                       })
                     ],
                   )).toList(),
                 )
             ),
           ),
          ],
        )
    );
  }
}
