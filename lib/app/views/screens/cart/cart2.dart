
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart/item_selection_controller.dart';
import '../product_detail/widgets/top_detail_product_widget.dart';
import 'cart3.dart';

class Cart2 extends StatelessWidget {
  Cart2({Key? key}) : super(key: key);
  static const IconData map = IconData(0xe3c8, fontFamily: 'MaterialIcons');

  // int _valuePayment = 0;
  ItemSelectionController itemSelectionController =
      Get.put(ItemSelectionController());



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const TopDetailProductWidget(),
// Thông tin giao hàng
              Container(
                margin: const EdgeInsets.only( top: 1.0),
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
                            child: const Text(
                              "Thay đổi",
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
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.only(left: 5.0),
                height: 90,
                child: Column(
                  children: [
//Thông tin khách hàng
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Nguyễn Thị Bích",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 34, 34, 34)),
                          )
                        ],
                      ),
                    ),
// Số điện thoại khách hàng
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.call),
                          Text(
                            "0986650333",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 102, 102, 102)),
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.location_on),
                          Expanded(
                            child: Text(
                              "34 Vũ Phạm Hàm, Phường Yên Hòa, Quận Cầu Giấy, Hà Nội",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 102, 102, 102)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
                          "assets/cart/icon_giaohang.png",
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
              SizedBox(
                height: 3,
                child: Container(
                  color: const Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                color: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.only(left: 5.0),
                height: 90,

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
                          "assets/cart/icon_payment1.png",
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
              ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                children: [
                  ListTile(
                    title: const Text("Tiền mặt khi nhận hàng"),
                    subtitle: const Text("Thu phí hộ: Miễn Phí"),
                    leading: Obx(()=>Radio(
                      groupValue: itemSelectionController.selectedItem.value,
                      onChanged: (value) {
                        itemSelectionController.onChangeItem(value);
                      },
                      value: "tienMat",
                    ),)
                  ),
                  ListTile(
                    title: const Text("Ví SenPay"),
                    subtitle: Container(
                      child: Row(
                        children: const [
                          Text("Liên kết:",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 170, 212),
                                  fontSize: 13)),
                          Expanded(
                            child: Text(
                                "Ví SenPay để thanh toán nhanh hơn và nhận các ưu đãi hoàn tiền",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10)),
                          ),

                        ],
                      ),
                    ),
                    leading: Obx(()=> Radio(
                      groupValue: itemSelectionController.selectedItem.value,
                      onChanged: (value) {itemSelectionController.onChangeItem(value);},
                      value: "viSenPay",
                    ))
                  ),
                  ListTile(
                      title: const Text("Ngân hàng liên kết trực tiếp"),
                      subtitle: Container(
                        child: Row(
                          children: const [
                            Text("Liên kết:",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 127, 170, 212),
                                fontSize: 13)),
                            Expanded(child: Text(
                                "Ví SenPay để trải nghiệm thanh toán nhanh qua ngân hàng liên kết trực tiếp",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10))),
                          ],
                        ),
                      ),
                      leading: Obx(()=> Radio(
                        groupValue: itemSelectionController.selectedItem.value,
                        onChanged: (value) {itemSelectionController.onChangeItem(value);},
                        value: "nganHangLienKet",
                      ))
                  ),
                  ListTile(
                      title: const Text("Thẻ ATM đã đăng ký Internet Banking"),

                      leading: Obx(()=> Radio(
                        groupValue: itemSelectionController.selectedItem.value,
                        onChanged: (value) {itemSelectionController.onChangeItem(value);},
                        value: "theATM",
                      ))
                  ),
                  ListTile(
                      title: const Text("Thẻ tín dụng/Thẻ ghi nợ"),
                      // subtitle: Container(
                      //   child: Row(
                      //     children: [
                      //       Text("Liên kết:",
                      //           style: TextStyle(
                      //               color: Color.fromARGB(255, 127, 170, 212))),
                      //       Text(
                      //           "Ví SenPay để thanh toán nhanh hơn và nhận các ưu đãi hoàn tiền",
                      //           style: TextStyle(
                      //               color: Colors.black))
                      //     ],
                      //   ),
                      // ),
                      leading: Obx(()=> Radio(
                        groupValue: itemSelectionController.selectedItem.value,
                        onChanged: (value) {itemSelectionController.onChangeItem(value);},
                        value: "theTinDung",
                      ))
                  ),
                  ListTile(
                      title: const Text("Chuyển Khoản"),
                      // subtitle: Container(
                      //   child: Row(
                      //     children: [
                      //       Text("Liên kết:",
                      //           style: TextStyle(
                      //               color: Color.fromARGB(255, 127, 170, 212))),
                      //       Text(
                      //           "Ví SenPay để thanh toán nhanh hơn và nhận các ưu đãi hoàn tiền",
                      //           style: TextStyle(
                      //               color: Colors.black))
                      //     ],
                      //   ),
                      // ),
                      leading: Obx(()=> Radio(
                        groupValue: itemSelectionController.selectedItem.value,
                        onChanged: (value) {itemSelectionController.onChangeItem(value);},
                        value: "chuyenKhoan",
                      ))
                  ),
                ],
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
                              "assets/cart/img_sale.png",
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
                            backgroundColor: const Color.fromARGB(255, 4, 119, 233),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Áp dụng',
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
                            child: const Text(
                              "Thành tiền: ",
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
                        child: const Text(
                          "(Đã bao gồm VAT nếu có) ",
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
                        Get.to(Cart3());
                      },
                      child: const Text(
                        'Tiến hành đặt hàng',
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
    ));
  }
}
