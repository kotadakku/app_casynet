import 'package:app_casynet/app/controller/bottom_nav_controller.dart';
import 'package:app_casynet/app/controller/detail_product_controller.dart';
import 'package:app_casynet/app/views/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart/api/product_cart_controller.dart';
import '../../../data/model/product_cart.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../widgets/appbar/appbar_cart.dart';
import 'widgets/chat_product_widget.dart';
import 'widgets/detail_product_widget.dart';
import 'widgets/featured_product_widget.dart';
import 'widgets/image_product_widget.dart';
import 'widgets/information_product_widget.dart';
import 'widgets/information_store_widget.dart';
import 'widgets/revervation_product.dart';
import 'widgets/tags_product_widget.dart';
import 'widgets/vote_product_widget.dart';

class DetailProductPage extends StatelessWidget {
  final DetailProductController _detailProductController = Get.find<DetailProductController>();
  DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCartController _productCartController = Get.find();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarCartWidget(),
            body: Obx(()=>_detailProductController.isLoading.value ?
              LoadingScreen():
              Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageProductWidget(controller: _detailProductController,),
                        InformationProductWidget(controller: _detailProductController,),
                        _detailProductController.product.value.requiredOptions == 0 ? SizedBox() :  RevervationProductWidget(controller: _detailProductController,),
                        InformationStoreWidget(controller: _detailProductController,),
                        DetailProductWidget(controller: _detailProductController,),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        VoteProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        ChatProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        TagsProductWidget(controller : _detailProductController),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        FeaturedProductWidget(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kYellowColor),
                      onPressed: () {
                        if(_detailProductController.product.value.requiredOptions == 0){
                          _productCartController.incrementProductCartDB(_detailProductController.product.value);

                          final snackBar = SnackBar(
                            content: Text("Thêm thành công"),
                            action: SnackBarAction(
                              label: "Kiểm tra",
                              onPressed: () {
                                Get.put(BottomNavController()).tabIndex.value = 2;
                                Get.toNamed(Routes.HOME);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else{
                          if(_detailProductController.date_controller.text.isEmpty || _detailProductController.date_controller.text == ''){
                            _detailProductController.date_focus.requestFocus();
                          } else if(_detailProductController.hours_controller.text.isEmpty || _detailProductController.hours_controller.text == ''){
                            _detailProductController.hours_focus.requestFocus();
                          }
                          else {

                          }
                        }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text("Đặt hàng")],
                      )),
                ),
              ],
            )
            )
        )
    );
  }





/*showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: Text("Sản phẩm đã được thêm vào giỏ hàng"),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Tiếp tục mua hàng", style: TextStyle(color: kYellowColor),),

                ),
                OutlinedButton(
                  onPressed: (){
                    Get.put(BottomNavController()).tabIndex.value = 2;
                    Get.toNamed(Routes.HOME);
                  },
                  child: Text("Kiểm tra giỏ hàng",style: TextStyle(color: kYellowColor),),

                ),

              ],
            )
          ],
        );
      });*/
}

