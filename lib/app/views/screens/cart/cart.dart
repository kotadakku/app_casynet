
import 'package:app_casynet/app/controller/cart/api/product_cart_controller.dart';
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:app_casynet/app/utlis/int_to_price.dart';
import 'package:app_casynet/app/views/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/account/auth/authentication_manager.dart';
import '../../widgets/appbar/appbar_cart.dart';
import 'widgets/itemCart.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  ProductCartController _productCartCOntroller = Get.find();
  AuthenticationManager _authenticationManager = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCartWidget(),
      body:Column(
        children: [
          //giỏ hang của bạn
          Container(
            alignment: const Alignment(0, 0),
            color: const Color.fromARGB(255, 241, 243, 253),
            height: 50.h,
            padding: EdgeInsets.only(left: 5.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const Icon(Icons.shopping_cart,
                    color: AppColors.yellowColor,
                  ),
                ),
                Text('your-cart'.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _productCartCOntroller.obx((state) =>
              ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: state.entries.map<Widget>((e)=>ItemCart(
                    nameStore: e.key.toString(),
                    itemCartStore: e.value ,
                  )).toList()
              ),
              onLoading: Center(
                child: CircularProgressIndicator(),
              )
            )
          ),
          Material(
            elevation: 1,
            color: Colors.white,
            child: Padding(padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 35,
                          alignment: AlignmentDirectional.centerStart,
                          child: Stack(
                            // alignment: const Alignment(-0.5, 1),
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: Image.asset(
                                  "assets/images/cart/img_sale.png",
                                  width: 70.h,
                                  height: 40.h,
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: const Text(
                                  "SALE",
                                  style: TextStyle(
                                      color: Color.fromARGB(193, 193, 115, 10),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          alignment: AlignmentDirectional.centerStart,
                          child: TextField(
                            
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: OutlineInputBorder(),
                              hintText: 'hint_voucher'.tr,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 2.0),
                            height: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(2.5),
                                backgroundColor:
                                const Color.fromARGB(255, 4, 119, 233),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {},
                              child: Text(
                                'apply'.tr,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                    ],
                  ),
                  // thành tiền
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "${'sub_total'.tr}: ",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 149, 156, 175),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                                child: Obx(()=>Text(
                                  '${IntToPrice(_productCartCOntroller.sumPriceValue.value).intToPrice()} đ',
                                  style: const TextStyle(
                                      color:
                                      Color.fromARGB(255, 255, 69, 69),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),)
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: Text(
                            "(${'in_VAT'.tr}) ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 149, 156, 175),
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                        ),
                      )

                    ],
                  ),
// button tiến hành đặt hàng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 80, right: 80),
                            backgroundColor:
                            const Color.fromARGB(255, 223, 180, 0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          // sự kiện chuyển màn
                          onPressed: () {
                            if(!_authenticationManager.isLogged.value || _authenticationManager.user_current.id == null){
                              Get.toNamed(Routes.AUTH, arguments: 0);
                              return;
                            }
                            if(_productCartCOntroller.checkBoxProduct.length <= 0){
                              print("error");
                              Get.snackbar('noti'.tr, "Vui lòng chọn ít nhất một sản phẩm để tiếp tục",);
                            }
                            else Get.toNamed(Routes.CHECKOUT);
                          },
                          child: Text(
                            'pro_cart'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
              child:
            ),*/
        ],
      ),

      /*Material(
          child: ),*/
    );
  }
}
