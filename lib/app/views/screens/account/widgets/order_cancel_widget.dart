import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/account/api/order_controller.dart';
import '../../../../data/model/product.dart';
import '../../../theme/app_colors.dart';

class OrderCancelWidget extends StatelessWidget {
  final List<String> name_stores;
  OrderController _orderController = Get.find();
  OrderCancelWidget({Key? key, required this.name_stores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _orderController.obx((state) => ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: state.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      state[index].nameStore.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: kTextLink),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.message_outlined,
                      color: kYellowColor,
                    )
                  ],
                )),
            Divider(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state[index].products?.length,
              itemBuilder: (context, i) => OrderItem(
                name_product: "Máy rửa xe Catorex - CTR",
                product: state.value[index].products[i],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Thành tiền",
                      style: TextStyle(color: kTextColor_gray),
                    ),
                    Text(
                      "1.655.001",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Chi tiết đơn này",
                            style: TextStyle(color: kYellowColor),
                          ),
                          style:
                          ElevatedButton.styleFrom(primary: Colors.white))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Mua lần nữa",
                          style: TextStyle(),
                        ),
                        style: ElevatedButton.styleFrom(primary: kYellowColor),
                      ))
                ],
              ),
            ),
            Container(
              height: 10,
              color: kBackgroundColor,
            )
          ]),
    ));
  }
}

class OrderItem extends StatelessWidget {
  final String name_product;
  final Product product;

  const OrderItem({Key? key, required this.name_product, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            "assets/product_detail/product_1.png"))),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.name.toString()),
                          Text(
                            product.price.toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phân loại hàng: ngocbich",
                            style: TextStyle(color: kTextColor, fontSize: 12),
                          ),
                          Text(
                            product.officialPrice.toString(),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: kTextColor,
                                fontSize: 12),
                          )
                        ],
                      ),
                      Text(
                        "x1",
                        style: TextStyle(color: kTextColor, fontSize: 12),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
