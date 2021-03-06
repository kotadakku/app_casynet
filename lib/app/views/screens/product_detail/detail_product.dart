
import 'package:app_casynet/app/controller/home/bottombar_controller.dart';
import 'package:app_casynet/app/controller/product_detail/detail_product_controller.dart';
import 'package:app_casynet/app/views/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart/api/product_cart_controller.dart';
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
  final BottombarController _bottombarController = Get.find();
  DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCartController _productCartController = Get.find();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarCartWidget(),
            body: Obx(()=>_detailProductController.isLoading.value ?
              const LoadingScreen():
              Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageProductWidget(controller: _detailProductController,),
                        InformationProductWidget(controller: _detailProductController,),
                        _detailProductController.product.value.requiredOptions == 0 ? const SizedBox() :  RevervationProductWidget(controller: _detailProductController,),
                        InformationStoreWidget(controller: _detailProductController,),
                        DetailProductWidget(controller: _detailProductController,),
                        Container(
                          height: 10,
                          color: AppColors.backgroundColor,
                        ),
                        const VoteProductWidget(),
                        Container(
                          height: 10,
                          color: AppColors.backgroundColor,
                        ),
                        ChatProductWidget(),
                        Container(
                          height: 10,
                          color: AppColors.backgroundColor,
                        ),
                        TagsProductWidget(controller : _detailProductController),
                        Container(
                          height: 10,
                          color: AppColors.backgroundColor,
                        ),
                        FeaturedProductWidget(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.yellowColor),
                      onPressed: () {
                        if(_detailProductController.product.value.requiredOptions == 0){
                          _productCartController.incrementProductCartDB(_detailProductController.product.value);

                          final snackBar = SnackBar(
                            content: const Text("Th??m th??nh c??ng"),
                            action: SnackBarAction(
                              label: "Ki???m tra",
                              onPressed: () {
                                _bottombarController.tabIndex.value = 2;
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
                        children: [const Icon(Icons.add), Text('order'.tr)],
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
          title: Text("S???n ph???m ???? ???????c th??m v??o gi??? h??ng"),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Ti???p t???c mua h??ng", style: TextStyle(color: AppColors.yellowColor),),

                ),
                OutlinedButton(
                  onPressed: (){
                    Get.put(BottomNavController()).tabIndex.value = 2;
                    Get.toNamed(Routes.HOME);
                  },
                  child: Text("Ki???m tra gi??? h??ng",style: TextStyle(color: AppColors.yellowColor),),

                ),

              ],
            )
          ],
        );
      });*/
}

