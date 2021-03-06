import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/cart/api/product_cart_controller.dart';
import '../../../../data/model/product_cart.dart';

class ItemCart extends StatelessWidget {
  final String nameStore;
  final List<ProductCart> itemCartStore;
  // final int qty; // số lượng
  const ItemCart(
      {Key? key,
      required this.nameStore,
      required this.itemCartStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCartController _productCartController = Get.find();
    

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
                // Obx(
                //   () => Checkbox(
                //     activeColor: const Color.fromARGB(255, 223, 180, 0),
                //     value:  checkBoxController.checkBoolTenCuaHang.value,
                //     onChanged: (value) {
                //       checkBoxController.checkBoolTenCuaHang.value =
                //           !checkBoxController.checkBoolTenCuaHang.value;
                //     },
                //   ),
                // ),
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
                      "assets/images/cart/ic_gift.png",
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'gift_seller'.tr,
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
                    Image.asset('assets/images/cart/icon_coin.png',
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
                itemCount: itemCartStore.length,
                itemBuilder: (context, index) {
                  TextEditingController textController = TextEditingController(text:itemCartStore[index].quantity.toString(),);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: Obx(

                          () => Checkbox(
                            activeColor: const Color.fromARGB(255, 223, 180, 0),
                            value: _productCartController.checkBoxProduct.value.contains(itemCartStore[index].p_id),
                            onChanged: (value) {
                              if(_productCartController.checkBoxProduct.value.contains(itemCartStore[index].p_id)) {
                                _productCartController.checkBoxProduct.remove(
                                    itemCartStore[index].p_id);
                                _productCartController.calsumPrice();
                              }else {
                                _productCartController.checkBoxProduct.add(itemCartStore[index].p_id);
                                _productCartController.calsumPrice();
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        // margin: const EdgeInsets.only(left: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
                        child: Image.network(
                          itemCartStore[index].p_image??"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png",
                          width: 90,
                          height: 90,
                          fit: BoxFit.fitHeight,
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
                                  itemCartStore[index].p_name??"Không có thông tin",
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
                                  itemCartStore[index].price.toString(),
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
                              ),
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
                                        onTap: (){
                                          if (int.parse(textController.text) <= 1) {
                                            _productCartController.deleteRow(itemCartStore[index].item_id);
                                          } else {
                                            _productCartController.updateQuantity((int.parse(textController.text) -1),itemCartStore[index]);
                                            textController.text = (int.parse(textController.text) -1).toString();
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
                                    child: TextField(
                                      onTap: (){
                                        textController.selection = TextSelection.fromPosition(TextPosition(offset: textController.text.length));
                                      },


                                      controller:  textController,
                                      textAlign: TextAlign.center,

                                      decoration: InputDecoration(
                                        // prefixText: "1",
                                        counterText: "",
                                        isDense: true,
                                        
                                        hintText: "",
                                        
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(5.0)

                                      ),
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      onSubmitted: (t){
                                        if(t.length != 0 && t!=null) {
                                          print(t.length);
                                          _productCartController.updateQuantity(int.parse(t), itemCartStore[index]);
                                        }
                                        else textController.text = itemCartStore[index].quantity.toString();
                                      },
                                    )
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
                                        onTap: () async {
                                          textController.text = (int.parse( textController.text) +1).toString();
                                          await _productCartController.updateQuantity((int.parse( textController.text) +1),itemCartStore[index]);

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
                                      _productCartController.deleteRow(itemCartStore[index].item_id);
                                    },
                                    child: SizedBox(
                                        child: Row(
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                        Text('delete'.tr,
                                          style: TextStyle(fontSize: 10),
                                        ),
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
