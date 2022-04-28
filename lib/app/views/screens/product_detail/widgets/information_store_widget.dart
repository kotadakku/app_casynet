
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/detail_store_controller.dart';
import '../../../../routes/app_pages.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class InformationStoreWidget extends StatelessWidget {
  const InformationStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailStoreController controller = Get.put(DetailStoreController());
    return Column(
      children: [
        Divider(height: 20,),
        Padding(padding: EdgeInsets.only(left: 5.0.w),
          child: ListTile(
            leading: CircleAvatar(
              child: Text("123"),
            ),
            title: Text("CÔNG TY TNHH Ô TÔ MỸ ĐÌNH THC"),
            subtitle: Row(
              children: [
                Text("bulary 12019", style: TextStyle(
                    color: kYellowColor
                ),),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Obx(()=>Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: controller.isLive.value ? Colors.green: kYellowColor,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),),
                    SizedBox(width: 5,),
                    Text("Hoạt động cách đây 3 giờ trước",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 12
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("2000", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Sản phẩm")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("75%", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Tỉ lệ phản hồi")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("145", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Giao dịch")
                ],
              )
            ],
          )
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Row(
            children: [
              Flexible(child: Container(
                height: 30,
                child: Obx(()=>
                  ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, color: controller.followed.value ? Colors.white: kYellowColor, size: sizeIcon.width,),
                          SizedBox(width: 5,),
                          Text("Theo dõi",
                            style: TextStyle(
                              color: controller.followed.value ? Colors.white: kYellowColor,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary:controller.followed.value ? kYellowColor: Colors.white,
                          onPrimary: kYellowColor,
                          side: BorderSide(
                            color: kYellowColor,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                      onPressed: () {
                        print("Followed");
                        controller.followed.value = !controller.followed.value;
                      },
                    )
                ),
              ),),
              SizedBox(width: 10.w,),
              Flexible(child:  Container(
                height: 30,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, size: sizeIcon.width,),
                      SizedBox(width: 5,),
                      Text("Xem cửa hàng",
                        style: TextStyle(
                        ),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kYellowColor,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                  ), onPressed: () {
                    Get.toNamed(Routes.STORE_DETAIL);
                },
                ),
              ),),
            ],
          ),
        )
      ],
    );
  }
}
