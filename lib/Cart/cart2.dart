import 'package:app_casynet/controller/cart/item_selection_controller.dart';
import 'package:app_casynet/widget/detail_product/top_detail_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart2 extends StatelessWidget {
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
              TopDetailProductWidget(),
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 1.0),
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 241, 243, 253),
                height: 50,
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
              Container(
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          map,
                          size: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
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
                        TextButton(
                            onPressed: () {},
                            child: Text(
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
                  color: Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.only(left: 5.0),
                height: 90,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                        children: [
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
                  color: Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: EdgeInsets.only(left: 5.0),
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
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
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
                  color: Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.only(left: 5.0),
                height: 90,

              ),
              SizedBox(
                height: 10,
                child: Container(
                  color: Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                color: Color.fromARGB(255, 255, 255, 255),
                height: 50,
                padding: EdgeInsets.only(left: 5.0),
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
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
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
                  color: Color.fromARGB(255, 242, 245, 253),
                ),
              ),
              //phuong thuc thanh toan
              ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("Tiền mặt khi nhận hàng"),
                    subtitle: Text("Thu phí hộ: Miễn Phí"),
                    leading: Obx(()=>Radio(
                      groupValue: itemSelectionController.selectedItem.value,
                      onChanged: (value) {
                        itemSelectionController.onChangeItem(value);
                      },
                      value: 1,
                    ),)
                  ),
                  ListTile(
                    title: Text("Ví SenPay"),
                    subtitle: Container(
                      child: Row(
                        children: [
                          Text("Liên kết:",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 170, 212))),
                          Text(
                              "Ví SenPay để thanh toán nhan hơn và nhận các ưu đãi hoàn tiền",
                              style: TextStyle(
                                  color: Colors.black))
                        ],
                      ),
                    ),
                    leading: Obx(()=> Radio(
                      groupValue: itemSelectionController.selectedItem.value,
                      onChanged: (value) {itemSelectionController.onChangeItem(value);},
                      value: 1,
                    ))
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [Text("Thông tin xuất hóa đơn")],
                ),
              ),
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
                            child: Text(
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
                      child: TextField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Mã giám giá',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 2.0),
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(2.5),
                            backgroundColor: Color.fromARGB(255, 4, 119, 233),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Ap Dung',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 40.0,
                            margin: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Text(
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
                                margin: EdgeInsets.only(top: 5.0),
                                child: Text(
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
                        margin: EdgeInsets.only(right: 5.0),
                        child: Text(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 80, right: 80),
                        backgroundColor: Color.fromARGB(255, 223, 180, 0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
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