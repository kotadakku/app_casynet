import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/home/stores_controller.dart';
import '../../controller/load_more_data/seller_loadmore_controller.dart';
import '../../routes/app_pages.dart';
import '../widgets/bottom_widget.dart';
import 'home/widgets/category_bottom_widget.dart';
import 'home/widgets/store_widget.dart';

class StoreHomeMore extends StatelessWidget {
  StoreHomeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllerLoadMore = Get.find<StoresMoreController>();

    SellerLoadMoreController _sellerController = Get.find();

    var category = Get.arguments[0].toString();
    // int pageNumber ;
    // int pageSizeNumber ;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: controllerLoadMore.scrollController,
          child: Column(
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
                            "assets/home/store/icon_filter.svg",
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
                        Get.toNamed(Routes.FILTER_PRODUCT);
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
                      groupValue: controllerLoadMore.isCar.value,
                      onChanged: (value){
                        controllerLoadMore.isCar.value =  !controllerLoadMore.isCar.value;
                        _sellerController.getSellersLoadMoreAPI(first_load: true,pageSize: _sellerController.pageSizeNumber,curPage: _sellerController.pageNumber, type_filter: '5');
                      },
                      activeColor: Color(0xffDFB400)),
                  Text("Ô tô"),
                  SizedBox(width: 20,),
                  Radio(
                      value: false,
                      groupValue: controllerLoadMore.isCar.value,
                      onChanged: (value){
                        controllerLoadMore.isCar.value = !controllerLoadMore.isCar.value;
                        _sellerController.getSellersLoadMoreAPI(first_load: true,pageSize: _sellerController.pageSizeNumber,curPage: _sellerController.pageNumber, type_filter: '6');
                      },
                      activeColor: Color(0xffDFB400)
                  ),
                  Text("Xe máy")
                ],
              ),),
              SizedBox(height: 10,child: Container(
                color: Color(0xffF1F3FD),
              ),),
              Container(
                height: MediaQuery.of(context).size.height-250.h,
                child: ListView(
                  controller: controllerLoadMore.scrollController,
                  children:[
                    Column(
                      children: [



                        controllerLoadMore.isCar == true
                            ? _sellerController.obx(
                                (state) => Container(
                              padding: EdgeInsets.only(bottom: 20.0.h),
                              child: state.isEmpty
                                  ? Text("Không có cửa hàng để hiển thị")
                                  : Wrap(
                                  spacing: 5.0.w,
                                  runSpacing: 10.0,
                                  children: (state as List)
                                      .map((e) => ItemCuaHangWidget(
                                    store: e,
                                  ))
                                      .toList()),
                            ),
                            onLoading: ItemCuaHangShimmer(),
                            onError: (error) => InkWell(
                              onTap: () {
                                // _sellerController.getSellersLoadMoreAPI(pageSize: pageSize, curPage: curPage, type_filter: type_filter)
                              },
                              child: Text("Tải lại"),
                            )

                        )
                            : _sellerController.obx((state) => Container(
                              padding: EdgeInsets.only(bottom: 20.0.h),
                              child: state.isEmpty
                                  ? Text("Không có cửa hàng để hiển thị")
                                  : Wrap(
                                  spacing: 5.0.w,
                                  runSpacing: 10.0,
                                  children: (state as List)
                                      .map((e) => ItemCuaHangWidget(
                                    store: e,
                                  ))
                                      .toList()),
                            ),
                            onLoading: ItemCuaHangShimmer(),
                            onEmpty: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Text("Tải dữ liệu thất bại!!"),
                                  InkWell(
                                    onTap: () {
                                      print('Tải lại');
                                    },
                                    child: Text("Tải lại"),
                                  )
                                ],
                              ),
                            ),
                            onError: (error) => Column(
                              children: [
                                Text('$error'),
                                InkWell(
                                  onTap: () {
                                    print('Tải lại');
                                  },
                                  child: Text("Tải lại"),
                                )
                              ],
                            )
                        ),

                      ],
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    )

                  ],
                ),
              ),

              CategoryBottomWidget(),
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
