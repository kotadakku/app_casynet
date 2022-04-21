
import 'package:app_casynet/controller/products_controller.dart';
import 'package:app_casynet/widget/home/reservation_home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/home_controller.dart';
import '../routes/app_pages.dart';
import '../widget/bottom_widget.dart';
import '../widget/home/category_bottom_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.find<ProductsController>();
    var category = Get.arguments[0].toString();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TopAccountWidget(),
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
                            category,
                            style: TextStyle(
                                color: Color(0xffDFB400),
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/home/store/icon_filter.svg", width: 15,),
                            SizedBox(width: 5,),
                            Text(
                              " Bộ lọc",
                              style: TextStyle(
                                color: Color(0xffB7BAC1),
                              ),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),
                        onTap: (){
                          Get.toNamed(Routes.FILTER_PRODUCT);
                        },
                      )

                    ],
                  ),
                ),

                SizedBox(height: 5, child: Container(color: Color(0xffF1F3FD),),),
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
                ),),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    // ItemBookWidget(
                    //     book_image: "assets/home/book/image.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                    // ItemBookWidget(
                    //     book_image: "assets/home/store/cuahang1.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                    // ItemBookWidget(
                    //     book_image: "assets/home/book/image.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                    // ItemBookWidget(
                    //     book_image: "assets/home/store/cuahang1.png",
                    //     distance: 4.5,
                    //     price: "1.290.000đ",
                    //     price_discount: "1.390.000đ",
                    //     book_name: "Máy rửa xe Catorex - CTR",
                    //     book_category: "Điện máy Đỗ Dũng"
                    // ),
                  ],
                ),
                SizedBox(height: 20,),
                CategoryBottomWidget(),
                BottomWidget(),
              ],
            ),
          )
      ),
    );
  }
}