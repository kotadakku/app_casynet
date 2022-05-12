import 'package:app_casynet/app/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/item_product_in_cart_controller.dart';
import '../../../data/model/item_product_in_cart.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../widgets/appbar_cart.dart';
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
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCartMeController _productCartController = Get.find();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarCartWidget(),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageProductWidget(),
                        InformationProductWidget(),
                        RevervationProductWidget(),
                        InformationStoreWidget(),
                        DetailProductWidget(),
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
                        TagsProductWidget(),
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
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kYellowColor),
                      onPressed: () {
                        _productCartController.insertProductCart(ProductCart(
                            p_id: 2,
                            p_sku: "no name",
                            p_name: "LTHT",
                            s_name: "Babaas",
                            discount_price: 12312,
                            p_image: "sffd",
                            quantity: 1,
                            price: 32423,
                            cartId: 13));

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
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text("Đặt hàng")],
                      )),
                ),
              ],
            )));
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

