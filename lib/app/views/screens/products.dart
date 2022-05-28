import 'package:app_casynet/app/views/widgets/appbar/appbar_home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/home/products_controller.dart';
import '../../routes/app_pages.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/shimmer/seller_shimmer.dart';
import 'home/widgets/category_bottom_widget.dart';
import 'home/widgets/items/product_item.dart';
import 'home/widgets/store_widget.dart';


class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarHomeWidget(),
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
                            _productsController.category_name.tr,
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
                            SvgPicture.asset("assets/images/home/store/icon_filter.svg", width: 15,),
                            SizedBox(width: 5,),
                            Text(
                              "filter".tr,
                              style: TextStyle(
                                color: Color(0xffB7BAC1),
                              ),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),
                        onTap: (){
                          Get.toNamed(Routes.FILTER_PRODUCT,
                              arguments: {
                                'controller': _productsController
                              }
                          );
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
                        groupValue: _productsController.isCar.value,
                        onChanged: (value){
                          _productsController.isCar.value = !_productsController.isCar.value;
                        },
                        activeColor: Color(0xffDFB400)),
                    Text("Ô tô"),
                    SizedBox(width: 20,),
                    Radio(
                        value: false,
                        groupValue: _productsController.isCar.value,
                        onChanged: (value){
                          _productsController.isCar.value = !_productsController.isCar.value;
                        },
                        activeColor: Color(0xffDFB400)
                    ),
                    Text("Xe máy")
                  ],
                ),),
                _productsController.obx((state) => Padding(padding: EdgeInsets.only(bottom: 15.h),
                    child: state.isEmpty ?
                    Text("Không có sẳn phẩm nào để hiển thi") :
                    Wrap(
                      spacing: 5.0.w,
                      runSpacing: 10.0,
                      children: (state as List).map((e) =>
                        ItemProductWidget(
                          product: e
                        )
                      ).toList()
                    )
                ),
                  onLoading: ItemSellerShimmer(),
                  onEmpty: Text('Không có sản phẩm nào để hiển thị'),
                ),
                Obx(()=>_productsController.haveNextPage.value ? _productsController.isLoading.value ?
                SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ):
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    height: 50,
                    child: Row(
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
                    ),
                  ),
                  onTap: (){
                    _productsController.loadMoreProducts();
                  },
                ) : Container()
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