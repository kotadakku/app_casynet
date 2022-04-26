
import 'package:app_casynet/app/views/screens/home/widgets/store_widget.dart';
import 'package:app_casynet/app/views/screens/theme/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../controller/home/datcho_controller.dart';
import '../../../../data/model/datcho.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/loading_overlay.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class ReservationWidget extends StatelessWidget {
  ReservationWidget({Key? key}) : super(key: key);

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
                         "Khuyến mãi".toUpperCase(),
                          style: AppTextTheme.titleProduct,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        _view_more("Khuyến mãi");
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
                  return LoadingOverlay(
                    isLoading: controller.loadingDatcho,
                    shimmer: ItemCuaHangShimmer(),
                    child: Padding(padding: EdgeInsets.only(bottom: 15.h),
                        child: controller.datchoList.isEmpty ?
                          Text("Không có sẳn phẩm nào để hiển thi") :
                          Wrap(
                          spacing: 5.0.w,
                          runSpacing: 10.0,
                          children: controller.datchoList.map((e) => GestureDetector(
                            child: ItemBookWidget(
                              product: e
                            ),
                            onTap: (){
                              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: { 'product_id': 12 },);
                            },
                          )).toList(),
                        )
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
  DatCho product;

  ItemBookWidget({
    Key? key, required this.product
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
                  Image.network(product.hinhanhsanpham.toString(),
                      fit: BoxFit.fill),
                  if(product.diemthuongcasycoin != null) Positioned(
                      right: 5,
                      top: 5,
                      child: ItemAddPoint(color: Colors.red, width: 50, point: product.diemthuongcasycoin)
                  ),
                  if(product.phantramgiamgia != null) Positioned(
                      top: 5,
                      left: 5,
                      child: ItemSale(color: kYellowColor, width: 40, sale: product.phantramgiamgia)
                  )
                ],
                // Image.asset("")
              ),
            ),
            SizedBox(height: 10.0.h,),
            Text(product.tensanpham.toString(),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.0.h,),
            Row(
              children: [
                Text(
                  product.giasanpham == null ? "Liên hệ" : product.giasanpham.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 5.w,),
                Text(
                  product.giauudai == null ? "" : product.giauudai.toString(),
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
                Expanded(child: Text(product.store!.tencuahang.toString(),
                  style: TextStyle(
                    fontSize: 12,

                  ),
                  overflow: TextOverflow.ellipsis,
                ),),

                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.locationArrow, color: kTextColor_gray, size: 15,),
                    SizedBox(width: 3,),
                    Text("${product.store?.khoangcachtoicuahang} km",
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



