
import 'package:app_casynet/app/controller/cart/api/product_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/account/new_address_controller.dart';
import '../../../controller/bottom_nav_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/home/search_controller.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';


class AppBarCartWidget extends StatelessWidget implements PreferredSizeWidget {

  // You also need to override the preferredSize attribute.
  // You can set it to kToolbarHeight to get the default appBar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  ProductCartController _productCartController = Get.find();

  @override
  Widget build(BuildContext context) {

    NewAddressController regioncontroller = Get.find<NewAddressController>();
    SearchController searchController = Get.find();

    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Get.put(BottomNavController()).tabIndex.value = 0;
          Get.offNamed(Routes.HOME);
        },
        child: Container(
            padding: EdgeInsets.only(left: 5.0.w),
            child: SvgPicture.asset(
              "assets/home/icon_top_home.svg",
              width: 40,
            )
        ),
      ),
      leadingWidth: 50,
      title: Container(
        height: 40,
        child:  TextField(
          readOnly: true,
          onTap: (){
            Get.toNamed(Routes.SEARCH);
          },

          textAlignVertical: TextAlignVertical.center,
          cursorColor: kTextColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.0.w),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: AppColors.borderGray_0_5
                  )

              ),
              hintStyle: TextStyle(
                  fontSize: 14.sp
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: kYellowColor
                  )

              ),
              hintText: 'Search Casynet',
              suffixIcon: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                    "title": "Chọn tỉnh/ thành phố", "regions": regioncontroller.provinces
                  });
                  if(data != null){
                    data.then((value){
                      searchController.setLocation(value['name']);
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                        color: AppColors.borderGray_0_5,
                      ),
                      SizedBox(width: 2.0.w,),
                      SvgPicture.asset(
                          "assets/home/icon_location.svg",
                          width: 14.sp),
                      SizedBox(width: 5.0.w,),
                      Obx(()=> Text(
                        searchController.location.value,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 13,
                        ),
                      ),),
                      SizedBox(width: 5.0.w,),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Get.toNamed(Routes.MESSAGES);
          },
          child: Center(
            child: Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                  "assets/product_detail/message.svg"),
            ),
          )
        ),
        GestureDetector(
          onTap: (){
            Get.toNamed(Routes.HOME);
          },
          behavior: HitTestBehavior.translucent,
          child: Center(
            child: Container(
                height: 30,
                width: 30,
                child: Stack(
                  children: [
                    Positioned.fill(
                      
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        child: SvgPicture.asset("assets/product_detail/cart.svg"),
                      )
                    ),
                    Obx(()=>_productCartController.countCart.value > 0 ?
                    Positioned(
                        right: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          child: Center(
                            child: Text('${_productCartController.countCart}',style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        )
                    ) : Container()),
                  ],
                )
            ),
          ),
        ),

        Center(
          child: Container(
            height: 30,
            width: 30,
            child: PopupMenuButton(
                elevation: 20,
                enabled: true,
                offset: Offset(30, 30),
                child: Icon(
                  Icons.more_horiz,
                  color: kTextColor,
                ),
                onSelected: (value) {
                  switch(value){
                    case 'home': Get.toNamed(Routes.HOME); break;
                    case 'product': Get.toNamed(Routes.PRODUCTS_SEEN); break;
                    case 'account': Get.toNamed(Routes.HOME); break;
                    case 'help': Get.toNamed(Routes.HOME);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.home_outlined,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15,
                              right: 10
                          ),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Trang chủ",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "home",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.production_quantity_limits,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15, right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sản phẩm đã xem",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "product",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.account_circle_outlined,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15,
                              right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tài khoản",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "account",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.help_outline,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15, right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trợ giúp",
                                  style: TextStyle(color: kTextColor),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "help",
                  ),
                ]
            ),
          ),
        )

      ],
    );
  }
}