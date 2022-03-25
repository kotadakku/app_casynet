
import 'package:app_casynet/controller/radio_car_controller.dart';
import 'package:app_casynet/screens/filter/filter_product.dart';
import 'package:app_casynet/screens/rua_xe_thay_dau.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';
import '../../screens/detail_product.dart';
import '../../screens/filter/filter_product_2.dart';

class ReservationWidget extends StatelessWidget {
  final String title;
  RadioController c = Get.put(RadioController());
  ReservationWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Container(child: CircleAvatar(
                      child: Text(
                        "123",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      backgroundColor: Color(0xffDFB400),
                    ),),
                    SizedBox(width: 15,),
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xffDFB400),
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    _view_more();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Xem thêm",
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                      SizedBox(width: 5,),
                      SvgPicture.asset("assets/home/store/icon_xemthem.svg", width: 5,),
                      SizedBox(width: 10,)
                    ],
                  ),
                )


              ],
            ),
          ),

          SizedBox(height: 5, child: Container(color: Color(0xffF1F3FD),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(()=>Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: c.isCar.value,
                          onChanged: (value){
                            c.isCar.value = !c.isCar.value;
                          },
                          activeColor: Color(0xffDFB400)),
                      Text("Ô tô"),
                      SizedBox(width: 20,),
                      Radio(
                          value: false,
                          groupValue: c.isCar.value,
                          onChanged: (value){
                            c.isCar.value = !c.isCar.value;
                          },
                          activeColor: Color(0xffDFB400)
                      ),
                      Text("Xe máy")
                    ],
                  ))

                ],
              ),
              GestureDetector(
                child: Row(
                  children: [
                    SvgPicture.asset("assets/home/store/icon_filter.svg", width: 15,),
                    SizedBox(width: 5,),
                    Text(
                      "Lọc",
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
        ],
      ),
    );
  }
  void _filter_product() {
    Get.to(FilterProductPage2());
  }

  void _view_more() {
    Get.to(RuaXeThayDauPage());
  }
}

class ItemBookWidget extends StatelessWidget {
  final String book_image;
  final String book_name;
  final String book_category;
  final String price;
  final String price_discount;
  final double distance;

  const ItemBookWidget({
    Key? key, required this.book_image,
    required this.book_name,
    required this.price,
    required this.price_discount,
    required this.distance, required this.book_category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) => Container(
      width: constraint.maxWidth/2-10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(book_image,
              fit: BoxFit.fitHeight,
              height: constraint.maxWidth/2-10,),
              Positioned(
                  child: Text("-20%")
              ),
              Positioned(
                  child: Text("-20%")
              )
            ],
            // Image.asset("")
          ),
          SizedBox(height: 10.0,),
          Text(book_name),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 5,),
              Text(
                price_discount,
                style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(book_category,
                style: TextStyle(
                    fontSize: 10
                ),
              ),

              Row(
                children: [
                  FaIcon(FontAwesomeIcons.locationArrow, color: kTextColor_gray, size: 12,),
                  SizedBox(width: 3,),
                  Text("$distance km",
                    style: TextStyle(
                        fontSize: 10
                    ),
                  )
                ],
              ),

            ],
          ),
          SizedBox(height: 10.0,),
          Container(
            padding: EdgeInsets.all(4),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.solidThumbsUp, color: kTextColor_gray, size: 12,),
                    SizedBox(width: 2.0,),
                    Text("33",
                      style: TextStyle(
                          fontSize: 10
                      )
                    )
                  ],
                ),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.comment, color: kTextColor_gray, size: 12,),
                    SizedBox(width: 2.0,),
                    Text("33",
                      style: TextStyle(
                          fontSize: 10
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share, size: 12, color: kTextColor_gray,),
                    SizedBox(width: 2.0,),
                    Text("4.3",
                      style: TextStyle(
                        fontSize: 10
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


