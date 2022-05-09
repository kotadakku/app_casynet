import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'checkbox_controller.dart';

class ItemCart extends StatelessWidget {
  final String nameStore;
  final String nameProduct;
  final int discount; // giá ưu đãi
  // final int oldPrice; // giá cũ
  final String imageProduct;
  // final int qty; // số lượng
  const ItemCart(
      {Key? key,
      required this.nameStore,
      required this.imageProduct,
      required this.nameProduct,
      required this.discount,
      /*required this.oldPrice,*/
      /*required this.qty*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    var soluong = 0.obs;
    final tencuahang = [].obs;
    final tensanpham = [].obs;

    final CheckBoxController checkBoxController = Get.put(CheckBoxController());

    return Material(
      child: Column(
        children: [
//Tên của hàng
          Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 255, 255, 255),
            height: 50,
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: const Color.fromARGB(255, 223, 180, 0),
                    value: checkBoxController.checkBoolTenCuaHang.value,
                    onChanged: (value) {
                      checkBoxController.checkBoolTenCuaHang.value =
                          !checkBoxController.checkBoolTenCuaHang.value;
                    },
                  ),
                ),
                Text(
                  // allchecked.tencuahang,
                  nameStore,
                  style: const TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0.5),
//quà tặng cửa hàng
          Container(
            alignment: const Alignment(0, 0),
            color: const Color.fromARGB(255, 255, 255, 255),
            height: 50,
            padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/cart/ic_gift.png",
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Quà Tặng Cửa Hàng ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/cart/icon_coin.png',
                        width: 20, height: 20),
                    const SizedBox(
                      width: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Bạn có ",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 13.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: "2000 Casycoin",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ],
                )
                /*Expanded(
                  child: )*/
              ],
            ),
          ),
          const SizedBox(height: 0.5),
// list sản phẩm
          Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.only(
                top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 4.0,
                    thickness: 1.0,
                  );
                },
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        width: 15.w,
                        height: 15.h,
                        child: Obx(
                          () => Checkbox(
                            activeColor: const Color.fromARGB(255, 223, 180, 0),
                            value: checkBoxController.checkBoolTenSanPham.value,
                            onChanged: (value) {
                              checkBoxController.checkBoolTenSanPham.value =
                                  !checkBoxController.checkBoolTenSanPham.value;
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        // margin: const EdgeInsets.only(left: 5.0),
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.network(
                          imageProduct,
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 25.h,
                                width: 150.w,
                                child: Text(
                                  nameProduct,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.0.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Container(
                                height: 25.h,
                                child: Text(
                                  discount.toString(),
                                  style: TextStyle(
                                      fontSize: 13.0.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20.h,
                                child: Text(
                                  "Phân loại hàng",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp),
                                ),
                              ),
                              Container(
                                height: 20.w,
                                child: Text(
                                  "1.390.000 đ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    // alignment: Alignment(0.0, 0.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5.w,
                                            color: Colors.lightBlue)),
                                    height: 30.h,
                                    width: 30.w,
                                    child: Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        splashColor: const Color.fromARGB(
                                            255, 227, 227, 227),
                                        onTap: () {
                                          if (soluong <= 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "số lượng đã tối thiểu, phải lớn hơn 0"),
                                            ));
                                          } else {
                                            soluong--;
                                            mycontroller.text =
                                                soluong.toString();
                                          }
                                        },
                                        child: SizedBox(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5.w,
                                            color: Colors.lightBlue)),
                                    width: 40.w,
                                    height: 30.h,
                                    child: Obx(
                                      () => TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: soluong.toString(),
                                          // prefixText: "1",
                                          counterText: "",
                                          border: InputBorder.none,
                                          contentPadding: const EdgeInsets.only(
                                              top: 8, bottom: 10),
                                        ),
                                        keyboardType: TextInputType.number,
                                        maxLength: 2,
                                        maxLines: 1,
                                        controller: mycontroller,
                                        onChanged: (t) {
                                          soluong.value = int.parse(t);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5.w,
                                            color: Colors.lightBlue)),
                                    height: 30.h,
                                    child: Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        splashColor: const Color.fromARGB(
                                            255, 227, 227, 227),
                                        onTap: () {
                                          if (soluong < 99) {
                                            soluong++;
                                            mycontroller.text =
                                                soluong.toString();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "số lượng đã tối đa, phải nhỏ hơn 100"),
                                            ));
                                          }
                                        },
                                        child: SizedBox(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /*btn xóa*/
                              Container(
                                // width: 30.w,
                                height: 30.h,
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: const Color.fromARGB(
                                        255, 227, 227, 227),
                                    onTap: () {
                                      print("Xóa");
                                    },
                                    child: SizedBox(
                                        child: Row(
                                      children: const [
                                        Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                        Text(
                                          "Xóa",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              ),

                              /*btn sửa*/
                              Container(
                                // width: 30.w,
                                height: 30.h,
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    splashColor: const Color.fromARGB(
                                        255, 227, 227, 227),
                                    onTap: () {
                                      print("ghi chú");
                                    },
                                    child: SizedBox(
                                        child: Row(
                                      children: const [
                                        Icon(
                                          Icons.edit,
                                          size: 15,
                                        ),
                                        Text(
                                          "Ghi chú",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
