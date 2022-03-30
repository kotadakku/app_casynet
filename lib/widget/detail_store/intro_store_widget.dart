import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';
import '../../containts/size.dart';
import '../../screens/detail_product.dart';
import '../home/reservation_home_widget.dart';
import 'gift_store_widget.dart';

class IntroStoreWidget extends StatelessWidget {
  const IntroStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          // Thông tin chi tiết
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.watch_later, size: sizeStar.width, color: kYellowColor,),
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
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.phone, size: sizeStar.width, color: kYellowColor,),
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
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.location_on_rounded, color: kYellowColor,size: sizeStar.width,),
              ),

              Expanded(child: Text("Địa chỉ: 587 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, Hà Nội",
              ),)
            ],
          ),
          //Thống kê
          Container(
            padding: EdgeInsets.all(10.0),
            child: DottedBorder(
              color: kYellowColor,
              padding: EdgeInsets.all(10.0),
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.add, color: kYellowColor, size: sizeStar.width,),
              ),
              Text("Tham gia: "),
              Text("3 năm",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          //Chất lượng
          Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
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
                      child: Icon(Icons.add, color: kYellowColor, size: sizeStar.width,),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Giới thiệu cửa hàng",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Với trang thiết bị và cơ sở vật chất nhà xưởng hiện đại bậc nhất tại Việt Nam, THC áp dụng những quy chuẩn về chất lượng hàng đầu thế giới như Kaizen - Nhật Bản, tiêu chuẩn quốc tế ISO 9001, SAE hiệp hội ô tô Mỹ, tiêu chuẩn 5S về dịch vụ và nhà xưởng."),
              Divider(
                height: 6,
                thickness: 1,
              ),
              TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Xem thêm",
                        style: TextStyle(
                            color: kYellowColor
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Icon(Icons.keyboard_arrow_down_sharp, color: kYellowColor,),
                      ),
                    ],
                  )
              )
            ],
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
                Padding(padding: EdgeInsets.only(top: 10),
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
                        Get.to(DetailProductPage());
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
