
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import 'gift_store_widget.dart';


class ProductStoreWidget extends StatelessWidget {
  const ProductStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          Container(
            color: Colors.white,
            child: Column(
              children: [

                SizedBox(height: 5, child: Container(color: Color(0xffF1F3FD),),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Obx(()=>Row(
                        //   children: [
                        //     Radio(
                        //         value: true,
                        //         groupValue: c.isCar.value,
                        //         onChanged: (value){
                        //           c.isCar.value = !c.isCar.value;
                        //         },
                        //         activeColor: Color(0xffDFB400)),
                        //     Text("Ô tô"),
                        //     SizedBox(width: 20,),
                        //     Radio(
                        //         value: false,
                        //         groupValue: c.isCar.value,
                        //         onChanged: (value){
                        //           c.isCar.value = !c.isCar.value;
                        //         },
                        //         activeColor: Color(0xffDFB400)
                        //     ),
                        //     Text("Xe máy")
                        //   ],
                        // ))

                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/home/store/icon_filter.svg", width: 15,),
                          SizedBox(width: 5,),
                          Text(
                            'filter'.tr,
                            style: TextStyle(
                              color: Color(0xffB7BAC1),
                            ),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                      onTap: (){
                        _filter_product();
                      },
                    )

                  ],
                ),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    // GestureDetector(
                    //   child: ItemProductWidget(
                    //       book_image: "assets/images/home/book/image.png",
                    //       distance: 4.5,
                    //       price: "1.290.000đ",
                    //       price_discount: "1.390.000đ",
                    //       book_name: "Máy rửa xe Catorex - CTR",
                    //       book_category: "Điện máy Đỗ Dũng"
                    //   ),
                    //   onTap: (){
                    //     Get.to(Routes.PRODUCT_DETAIL);
                    //   },
                    // ),
                    // ItemProductWidget(
                    //     book_image: "assets/images/home/store/cuahang1.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                    // ItemProductWidget(
                    //     book_image: "assets/images/home/book/image.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                    // ItemProductWidget(
                    //     book_image: "assets/images/home/store/cuahang1.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                  ],
                ),
                Divider(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('more'.tr, style: TextStyle(
                        color: AppColors.yellowColor
                    ),),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.yellowColor, size: 15,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _filter_product() {
    Get.toNamed(Routes.FILTER);
  }
}
