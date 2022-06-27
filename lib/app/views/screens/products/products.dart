import 'package:app_casynet/app/views/widgets/appbar/appbar_home_widget.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/products/products_controller.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../widgets/bottom_widget.dart';
import '../../widgets/shimmer/seller_shimmer.dart';
import '../home/widgets/category_bottom_widget.dart';
import '../home/widgets/items/product_item.dart';
import '../home/widgets/store_widget.dart';


class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _productsController.getProductsAPI(first_load: true),
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
                          Container(child: const CircleAvatar(
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
                            style: const TextStyle(
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
                              style: const TextStyle(
                                color: Color(0xffB7BAC1),
                              ),
                            ),
                            const SizedBox(width: 10,)
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
                        activeColor: const Color(0xffDFB400)),
                    Text('car'.tr),
                    SizedBox(width: 20,),
                    Radio(
                        value: false,
                        groupValue: _productsController.isCar.value,
                        onChanged: (value){
                          _productsController.isCar.value = !_productsController.isCar.value;
                        },
                        activeColor: Color(0xffDFB400)
                    ),
                    Text('motorcycle'.tr)
                  ],
                ),),
                Obx(()=>LoadingOverlayShimmer(
                    isLoadingAPI: _productsController.isLoading.value,
                    isLoadingDB: false,
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 3.3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: _productsController.productList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ItemProductWidget(
                            index: index,
                            products: _productsController.productList,
                          );
                        }
                    ),
                    funcRetry: () => _productsController.getProductsAPI(first_load: true),
                    funcSkip: () => _productsController.error.value = ''
                )),
                Obx(()=>_productsController.haveNextPage.value ? _productsController.isLoading.value ?
                const SizedBox(
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
                        Text('more'.tr, style: const TextStyle(
                            color: AppColors.yellowColor
                        ),),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.yellowColor, size: 15,),
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
      ),
    );
  }
}