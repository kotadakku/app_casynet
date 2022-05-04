import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class OrderCancelWidget extends StatelessWidget {
  final List<String> name_stores;

  const OrderCancelWidget({Key? key, required this.name_stores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: name_stores.length,
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
                      name_stores[index],
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
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => OrderItem(
                name_product: "Máy rửa xe Catorex - CTR",
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
    );
  }
}

class OrderItem extends StatelessWidget {
  final String name_product;

  const OrderItem({Key? key, required this.name_product}) : super(key: key);

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
                            "assets/detail_product/product_1.png"))),
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
                      Text(name_product),
                      Text(
                        "1.290.000 đ",
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
                        "1.290.000 đ",
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
