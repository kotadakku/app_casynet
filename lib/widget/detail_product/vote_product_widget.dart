
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/detail_product_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class VoteProductWidget extends StatelessWidget {
  const VoteProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailProductController controller = Get.find<DetailProductController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0.w, top: 10.h),
          child: Text("Đánh giá sản phẩm", style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        ),
        Divider(color: kTextColor,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: IntrinsicHeight(child:Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4.5",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("/5")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                              Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                            ],
                          ),
                        ],
                      ),
                      Text("(2 lượt đánh giá)")
                    ],

                  )
              ),
              VerticalDivider(
                width: 20,
                thickness: .5,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: LinearProgressIndicator(

                              value: 0.8,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(padding: EdgeInsets.only(left: 5.0), child: Text("1", textAlign: TextAlign.end,)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: LinearProgressIndicator(
                              value: 0.2,
                              color: kYellowColor,
                              backgroundColor: kTextColor,

                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(padding: EdgeInsets.only(left: 5.0), child: Text("20", textAlign: TextAlign.end,)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: LinearProgressIndicator(
                              value: 0.5,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),),
                          Expanded(
                            flex: 2,
                            child: Container(padding: EdgeInsets.only(left: 5.0), child: Text("8", textAlign: TextAlign.end,)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: LinearProgressIndicator(
                              value: 0.4,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),),
                          Expanded(
                            flex: 2,
                            child: Container(padding: EdgeInsets.only(left: 5.0), child: Text("10", textAlign: TextAlign.end,)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeIcon.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: LinearProgressIndicator(
                              value: 0.4,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Container(padding: EdgeInsets.only(left: 5.0), child: Text("3", textAlign: TextAlign.end,)),
                          )
                        ],
                      ),
                    ],
                  ),
              )
            ],
          ),
        )),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ảnh gửi từ khách hàng (34)",
                style: TextStyle(

                ),
              ),
              Row(
                children: [
                  Text("Xem tất cả",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 12, color: Colors.blue,)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 0.25.sw-7.5,
          child: Obx(()=>
            ListView.builder(
                itemCount: controller.more_image.value ? 8 : 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  if(index ==3 && !controller.more_image.value){
                    return GestureDetector(
                      onTap: (){
                        controller.more_image.value = true;
                      },
                      child: Container(
                          width: 0.25.sw-7.5,
                          height: 0.25.sw-7.5,
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset('assets/detail_product/product_1.png', fit: BoxFit.cover),
                                Container(
                                  color: Colors.black.withOpacity(0.6),
                                  alignment: Alignment.center,

                                  child: Text('+30', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),),
                                ),

                              ]
                          )
                      ),
                    );
                  }
                  return Container(
                    width:  0.25.sw-7.5,
                    height: 0.25.sw-7.5,
                    margin: EdgeInsets.only(left: 5.0),
                    child: Image.asset(
                        "assets/detail_product/product_1.png"
                    ),
                  );
                },
              )
          )
        ),
        SizedBox(height: 10,),


      ],
    );
  }
}
