
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/filter_product_controller.dart';
import '../../../theme/app_colors.dart';


class DistrictProductWidget extends StatelessWidget {
  const DistrictProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterDistrictController controller =  Get.find<FilterDistrictController>();
    List<String> _districts = [
      'Quận Cầu Giấy', 'Quận Hà Đông', 'Quận Hoàn Kiếm', 'Quận Hai Bà Trưng', 'Quận Mỹ Đình'
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
                  const Text("Quận/Huyện",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    height: 30,
                    child: OutlinedButton(
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16,),
                          const Text("Hà Nội")
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: kYellowColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ), onPressed: () {  },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){
                        controller.expand();
                      },
                      iconSize: 20,
                      icon: AnimatedBuilder(
                        animation: controller.animationDistrict,
                        builder: (context, child){
                          return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                        },
                      )
                  )
                ],
              ),
            ),
           SizeTransition(
             sizeFactor: controller.animationDistrict,
             child: Container(
                 width: double.infinity,
                 child: Wrap(
                   spacing: 5.0.w,
                   children: _districts.map((e) => Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Obx((){
                         bool isContains = controller.isContain(e);
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
                             controller..change_list(e);

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
