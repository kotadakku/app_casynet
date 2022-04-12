
import 'package:app_casynet/controller/datcho_controller.dart';
import 'package:app_casynet/screens/products.dart';
import 'package:app_casynet/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class ReservationWidget extends StatelessWidget {
  final String title;
  ReservationWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Material(
              elevation: 2,
              child: Padding(padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: CircleAvatar(
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
                        _view_more(title);
                      },
                      child: Row(
                        children: [
                          Text(
                            "Xem thêm",
                            style: TextStyle(
                              color: Color(0xffB7BAC1),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset("assets/home/store/icon_xemthem.svg", width: 5,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GetBuilder<DatChoController>(
                        init: DatChoController(),
                        builder: ((controller) {
                          return Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue: controller.isCar,
                                  onChanged: (value){
                                    controller.updateIsCar(controller.isCar);
                                    controller.updateAPI();
                                  },
                                  activeColor: Color(0xffDFB400)),
                              Text("Ô tô"),
                              SizedBox(width: 20,),
                              Radio(
                                  value: false,
                                  groupValue: controller.isCar,
                                  onChanged: (value){
                                    controller.updateIsCar(controller.isCar);
                                    controller.updateAPI();
                                  },
                                  activeColor: Color(0xffDFB400)
                              ),
                              Text("Xe máy")
                            ],
                          );
                        }))

                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
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
            GetBuilder<DatChoController>(
                init: DatChoController(),
                builder: ((controller) {
                  return Padding(padding: EdgeInsets.only(bottom: 15.h),
                      child: Wrap(
                        spacing: 5.0.w,
                        runSpacing: 10.0,
                        children: controller.datchoList.map((e) => GestureDetector(
                          child: ItemBookWidget(
                            book_image: e.hinhanhsanpham.toString(),
                            distance: double.parse(e.khoangcachtoicuahang.toString()),
                            price: e.giauudai.toString(),
                            price_discount: e.giasanpham.toString(),
                            book_name: e.tensanpham.toString(),
                            book_category: e.tencuahang.toString(),
                            add_point: 12,

                          ),
                          onTap: (){
                            Get.toNamed(Routes.PRODUCT_DETAIL, arguments: { 'product_id': 12 });
                          },
                        )).toList(),
                      )
                  );
                }))
          ],
        ),
      ),
    );
  }
  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT);
  }

  void _view_more(title) {
    Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title]);
  }
}

class ItemBookWidget extends StatelessWidget {
  final String book_image;
  final String book_name;
  final String book_category;
  final String price;
  final String price_discount;
  final double distance;
  int? add_point;
  int? sale;

  ItemBookWidget({
    Key? key, required this.book_image,
    required this.book_name,
    required this.price,
    required this.price_discount,
    required this.distance, required this.book_category,
    this.add_point,
    this.sale
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double grid = .5;
      if(constraints.maxWidth > 500){
        grid = .333;
      }
      return Container(
        width: grid.sw -5.0.w*(1/grid + 1)*grid,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: grid.sw -5.0.w*(1/grid + 1)*grid,
              width: grid.sw -5.0.w*(1/grid + 1)*grid,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(book_image,
                      fit: BoxFit.fill),
                  if(add_point != null) Positioned(
                      right: 5,
                      top: 5,
                      child: ItemAddPoint(color: Colors.red, width: 50, point: add_point)
                  ),
                  if(sale != null) Positioned(
                      top: 5,
                      left: 5,
                      child: ItemSale(color: kYellowColor, width: 40, sale: sale)
                  )
                ],
                // Image.asset("")
              ),
            ),
            SizedBox(height: 10.0.h,),
            Text(book_name),
            SizedBox(height: 10.0.h,),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 5.w,),
                Text(
                  price_discount,
                  style: TextStyle(
                      fontSize: 13.sp,
                      decoration: TextDecoration.lineThrough
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(book_category,
                  style: TextStyle(
                      fontSize: 12
                  ),
                ),

                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.locationArrow, color: kTextColor_gray, size: 15,),
                    SizedBox(width: 3,),
                    Text("$distance km",
                      style: TextStyle(
                          fontSize: 12.sp
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
                      FaIcon(FontAwesomeIcons.solidThumbsUp, color: kTextColor_gray, size: IconSize.iconSize,),
                      SizedBox(width: 2.0,),
                      Text("33",
                          style: TextStyle(
                              fontSize: 15.sp
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.comment, color: kTextColor_gray, size: IconSize.iconSize,),
                      SizedBox(width: 2.0,),
                      Text("33",
                          style: TextStyle(
                              fontSize: 15.sp
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [

                      Text("4.3",
                        style: TextStyle(
                            fontSize: 15.sp
                        ),
                      ),
                      SizedBox(width: 2.0,),
                      Icon(Icons.star_outlined, size: 15, color: kTextColor_gray,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ItemAddPoint extends StatelessWidget {
  final Color color;
  final double width;
  final int? point;
  const ItemAddPoint({Key? key, required this.color, required this.width, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Stack(
        children: [
          Stack(
            children: [

              SvgPicture.asset("assets/home/sale.svg", height: 20, color: color,),
              Positioned.fill(
                  child: Center(
                    child: Text("+$point điểm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13
                      ),
                    ),
                  )
              ),
            ],
          ),
          Positioned(
            bottom : 0.5,
            left: 4,
            child: SvgPicture.asset("assets/home/rect_sale.svg", height: 5, color: color,
            ),
          ),


        ],
      ),
    );
  }
}
class ItemSale extends StatelessWidget {
  final Color color;
  final double width;
  final int? sale;
  const ItemSale({Key? key, required this.color, required this.width, required this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: width,
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
            child: Stack(
              children: [
                SvgPicture.asset("assets/home/sale.svg", height: 20, fit: BoxFit.fitHeight, width: 25, color: color,),
                Positioned.fill(
                    child: Center(
                      child: Text("-$sale %",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
                        ),
                      ),
                    )
                ),
              ],
            )
          ),

          Positioned(
            bottom : 0.5,
            right: 4,
            child: SvgPicture.asset("assets/home/rect_sale.svg", height: 5, color: color,
            ),
          ),


        ],
      ),
    );
  }
}



