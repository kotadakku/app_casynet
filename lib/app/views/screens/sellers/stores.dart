import 'package:app_casynet/app/views/widgets/appbar/appbar_home_widget.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay_shimmer.dart';
import 'package:app_casynet/app/views/widgets/shimmer/seller_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/stores/stores_controller.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/bottom_widget.dart';
import '../home/widgets/category_bottom_widget.dart';
import '../home/widgets/items/seller_item.dart';

class StoreHomeMore extends StatelessWidget {
  StoreHomeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    StoresController _sellersController = Get.find();

    var category = Get.arguments[0].toString();

    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: CircleAvatar(
                        child: Text(
                          "123",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xffDFB400),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      category,
                      style: TextStyle(
                          color: Color(0xffDFB400),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/home/store/icon_filter.svg",
                        width: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        " Bộ lọc",
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(Routes.FILTER_PRODUCT, arguments: {
                      'controller': _sellersController
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
            child: Container(
              color: Color(0xffF1F3FD),
            ),
          ),

          Obx(()=>Row(
            children: [
              Radio(
                  value: true,
                  groupValue: _sellersController.isCar.value,
                  onChanged: (value){
                    _sellersController.isCar.value =  !_sellersController.isCar.value;
                    _sellersController.getSellersAPI(first_load: true, type_filter: '5');
                  },
                  activeColor: Color(0xffDFB400)),
              Text('car'.tr),
              SizedBox(width: 20,),
              Radio(
                  value: false,
                  groupValue: _sellersController.isCar.value,
                  onChanged: (value){
                    _sellersController.isCar.value = !_sellersController.isCar.value;
                    _sellersController.getSellersAPI(first_load: true, type_filter: '6');
                  },
                  activeColor: Color(0xffDFB400)
              ),
              Text('motorcycle'.tr)
            ],
          ),),
          SizedBox(height: 10,child: Container(
            color: Color(0xffF1F3FD),
          ),),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _sellersController.getSellersAPI(first_load: true),
              child: Obx(()=>
                LoadingOverlayShimmer(
                  isLoadingAPI: _sellersController.isLoadingApi.value, isLoadingDB: false,
                  child: GridView.builder(
                      shrinkWrap: true,
                      controller: _sellersController.scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 2.3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount: _sellersController.sellerListLoadMore.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemSellerWidget(
                          index: index,
                          sellers: _sellersController.sellerListLoadMore,
                        );
                      }

                  ),
                  funcRetry: () => _sellersController.getSellersAPI(first_load: true),
                  funcSkip: () => _sellersController.error.value = '')

              ),
            )
          )
          // CategoryBottomWidget(),
          // BottomWidget(),
        ],
      )
    );
  }
}
