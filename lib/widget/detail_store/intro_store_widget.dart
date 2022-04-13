import 'package:app_casynet/routes/app_pages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../screens/detail_product.dart';
import '../home/reservation_home_widget.dart';
import 'gift_store_widget.dart';

class IntroStoreWidget extends StatelessWidget {
  const IntroStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          // Thông tin chi tiết
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.watch_later, size: sizeIcon.width, color: kYellowColor,),
                )
              ),

              Text("Giờ mở cửa  "),
              Text("8h00  -  17h30",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.w),
                  child: Icon(Icons.phone, size: sizeIcon.width, color: kYellowColor,),
                )
              ),
              Text("Điện thoại  "),
              Text("0962.68.87.68",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.w),
                  child: Icon(Icons.location_on_rounded, color: kYellowColor,size: sizeIcon.width,),
                )
              ),

              Expanded(child: Text("Địa chỉ: 587 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, Hà Nội",),)
            ],
          ),
          //Thống kê
          Container(
            padding: EdgeInsets.all(10.0.w),
            child: DottedBorder(
              color: kYellowColor,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(10.0),
              dashPattern: [6, 4, 6, 4, 6, 4],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add, color: kYellowColor,),
                          Text("90", style: TextStyle(
                              color: kYellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text("Sản phẩm",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add, color: kYellowColor,),
                          Text("145", style: TextStyle(
                              color: kYellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text("Giao dịch",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add, color: kYellowColor,),
                          Text("75%", style: TextStyle(
                              color: kYellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text("Tỷ lệ phản hồi",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),

                ],
              ),
            ),
          ),
          // Năm tham gia

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                ),
                Text("Tham gia: "),
                Text("3 năm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          //Chất lượng
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                    SizedBox(width: 10),
                    Text("4.5",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(" Chất lượng")
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                    ),
                    Text("Báo xấu: "),
                    Text("3",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: 20,),
          // Giới thiệu cửa hàng
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Giới thiệu cửa hàng",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Obx(()=>Text("""Với trang thiết bị và cơ sở vật chất nhà xưởng hiện đại bậc nhất tại Việt Nam, THC áp dụng những quy chuẩn về chất lượng hàng đầu thế giới như Kaizen - Nhật Bản, tiêu chuẩn quốc tế ISO 9001, SAE hiệp hội ô tô Mỹ, tiêu chuẩn 5S về dịch vụ và nhà xưởng.
              Chúng tôi là trung tâm dịch vụ sửa chữa ô tô đầu tiên đưa tiêu chuẩn 4s vào dịch vụ sửa chữa đó là 4 tiêu chuẩn:""",
                  overflow: isReadMore.value ? TextOverflow.ellipsis : TextOverflow.visible,
                  maxLines: isReadMore.value ? 5: null,
                ),),
                Divider(
                  height: 6,
                  thickness: 1,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    isReadMore.value = !isReadMore.value;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(()=>Text(isReadMore.value ? "Xem thêm": "Ẩn bớt",
                        style: TextStyle(
                            color: kYellowColor
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Obx(()=>Icon(isReadMore.value ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp, color: kYellowColor,)),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Container(
            color: kBackgroundColor,
            height: 10,
          ),
          ReservationWidget(title: 'Khuyến mãi',),
          Container(
            color: kBackgroundColor,
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Text(
                    'Sản phẩm nổi bật',
                    style: TextStyle(
                        color: Color(0xffDFB400),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Divider(height: 20,),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    GestureDetector(
                      child: ItemBookWidget(
                          book_image: "assets/home/book/image.png",
                          distance: 4.5,
                          price: "1.290.000đ",
                          price_discount: "1.390.000đ",
                          book_name: "Máy rửa xe Catorex - CTR",
                          book_category: "Điện máy Đỗ Dũng"
                      ),
                      onTap: (){
                        Get.toNamed(Routes.PRODUCT_DETAIL);
                      },
                    ),
                    ItemBookWidget(
                        book_image: "assets/home/store/cuahang1.png",
                        distance: 4.5,
                        price: "1.290.000đ",
                        price_discount: "1.390.000đ",
                        book_name: "Máy rửa xe Catorex - CTR",
                        book_category: "Điện máy Đỗ Dũng"
                    ),
                    ItemBookWidget(
                        book_image: "assets/home/book/image.png",
                        distance: 4.5,
                        price: "1.290.000đ",
                        price_discount: "1.390.000đ",
                        book_name: "Máy rửa xe Catorex - CTR",
                        book_category: "Điện máy Đỗ Dũng"
                    ),
                    ItemBookWidget(
                        book_image: "assets/home/store/cuahang1.png",
                        distance: 4.5,
                        price: "1.290.000đ",
                        price_discount: "1.390.000đ",
                        book_name: "Máy rửa xe Catorex - CTR",
                        book_category: "Điện máy Đỗ Dũng"
                    ),
                  ],
                ),
                Divider(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Xem thêm", style: TextStyle(
                      color: kYellowColor
                    ),),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(Icons.keyboard_arrow_down_sharp, color: kYellowColor, size: 15,),
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
}
