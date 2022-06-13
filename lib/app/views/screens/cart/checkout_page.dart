import 'package:app_casynet/app/controller/cart/api/payment_method_controller.dart';
import 'package:app_casynet/app/controller/cart/checkout_controller.dart';
import 'package:app_casynet/app/views/widgets/appbar/appbar_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/cart/api/shipping_method_controller.dart';
import '../../../routes/app_pages.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key}) : super(key: key);
  static const IconData map = IconData(0xe3c8, fontFamily: 'MaterialIcons');

  CheckoutController _checkoutController = Get.find();
  ShippingMethodController _shippingMethodController = Get.find();
  PaymentMethodController _paymentMethodController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarCartWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
// Thông tin giao hàng
              Container(
                margin: const EdgeInsets.only(top: 1.0),
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 241, 243, 253),
                height: 50,
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Thông tin giao hàng",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
//Địa chỉ nhận hàng
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              map,
                              size: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              child: const Text(
                                "Địa chỉ nhận hàng",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
//button thay đổi
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  _checkoutController.address_default.id != null?"Thay đổi":'add'.tr,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 85, 170)),
                                ))
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
// Thông tin khách hàng
              _checkoutController.address_default.id != null ?
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  children: [
//Thông tin khách hàng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _checkoutController.address_default.lastname?? '',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 34, 34, 34)),
                        )
                      ],
                    ),

// Số điện thoại khách hàng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.call),
                        Text(
                          _checkoutController.address_default.phone??'',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            '${_checkoutController.address_default.street[0]}',
                            /*"34 Vũ Phạm Hàm, Phường Yên Hòa, Quận Cầu Giấy, Hà Nội",*/
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 102, 102, 102)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ):
                  SizedBox(
                    height: 90,
                    child: Text('Chưa có địa chỉ giao hàng'),
                  ),
              SizedBox(
                height: 10,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/cart/icon_giaohang.png",
                              width: 30,
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              child: const Text(
                                "Phương thức vận chuyển",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              _shippingMethodController.obx((state) =>
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: state.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return RadioListTile<String>(
                        value: state[index].carrierCode,
                        groupValue: _checkoutController.selectShippingMethod.value,
                        onChanged: (value){
                            _checkoutController.onChangeSelectShipping(state[index]);
                        },
                        title: Text('${state[index].carrierTitle}'),
                      );
                    }
                ),
                onLoading: CircularProgressIndicator(),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              // Container(
              //   alignment: const Alignment(0, 0),
              //   color: const Color.fromARGB(255, 255, 255, 255),
              //   padding: const EdgeInsets.only(left: 5.0),
              //   height: 90,
              // ),
              SizedBox(
                height: 10,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/cart/icon_payment1.png",
                              width: 30,
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              child: const Text(
                                "Phương thức thanh toán",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
//Phương thức thanh toán
              _paymentMethodController.obx((state) =>
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index){
                      return RadioListTile<String>(
                          title: Text("${state[index].title}"),
                          subtitle: const Text("Thu phí hộ: Miễn Phí"),
                          onChanged: (value) {
                            _checkoutController.onChangeItem(state[index]);
                          },
                          value: state[index].code,
                          groupValue: _checkoutController.selectPayment.value,
                      );
                    },
                  ),
              ),
//Thông tin xuất hóa đơn
              Container(
                height: 50.h,
                child: Row(
                  children: const [Text("Thông tin xuất hóa đơn")],
                ),
              ),
//Mã giảm giá
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      alignment: AlignmentDirectional.centerStart,
                      child: Stack(
                        // alignment: const Alignment(-0.5, 1),
                        children: [
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Image.asset(
                              "assets/images/cart/img_sale.png",
                              width: 70,
                              height: 40,
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
                    flex: 2,
                    child: Container(
                      height: 50,
                      alignment: AlignmentDirectional.centerStart,
                      child: const TextField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Mã giám giá',
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
                        height: 50,
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
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
//Thành tiền
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 40.0,
                            margin: const EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Text(
                              "${'sub_total'.tr}: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 149, 156, 175),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40.0,
                                margin: const EdgeInsets.only(top: 5.0),
                                child: const Text(
                                  "100.000.000.000 đ ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 69, 69),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 20,
                        margin: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          "(${'in_VAT'.tr}) ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 149, 156, 175),
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
//button đặt tiền
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        backgroundColor: const Color.fromARGB(255, 223, 180, 0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.CHECKOUT_SUCCESS);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
