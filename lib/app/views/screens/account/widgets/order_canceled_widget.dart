import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/account/api/order_controller.dart';
import '../../../../controller/account/order_account_controller.dart';
import '../../../../data/model/product.dart';
import '../../../theme/app_colors.dart';

class OrderCanceledWidget extends StatelessWidget {

  OrderController _orderController = Get.find();
  OrderAccountController _orderAccountController = Get.find();
  OrderCanceledWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> _orderController.isLoadingCancel.value ? Center(
      child: CircularProgressIndicator(),
    ):
      Obx(()=>ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: _orderController.orderCanceledList.value.length+1,
          shrinkWrap: true,
          itemBuilder: (context, index){
            if(index < _orderController.orderCanceledList.value.length)
              return  ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10.w, top: 5, bottom: 5, right: 10.w),
                        child: Row(
                          children: [
                            Text(
                              _orderController.orderCanceledList[index].nameStore.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kTextLink
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.chat_bubble_2,
                              color: kYellowColor,
                            ),
                            Spacer(),
                            Text('ĐÃ HỦY',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )),
                    Divider(),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _orderController.orderCanceledList[index].products?.length,
                        itemBuilder: (context, i){
                          return  OrderItem(
                            product: _orderController.orderCanceledList.value[index].products![i],
                          );
                        }
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
                  ]);
            else return Obx(()=>_orderAccountController.isLoadingCancel.value ?
            SizedBox(
              height: 50,
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ):
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Xem thêm", style: TextStyle(
                        color: kYellowColor
                    ),),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(Icons.keyboard_arrow_down_sharp, color: kYellowColor, size: 15,),
                    )
                  ],
                ),
              ),
              onTap: (){
                _orderAccountController.loadMoreCancel();
              },
            ));
          }
      )
      )
    );
  }
}

class OrderItem extends StatelessWidget {
  final Product product;

  const OrderItem({Key? key, required this.product}) : super(key: key);

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
                            "assets/images/product_detail/product_1.png"))),
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
                          Expanded(child: Text(product.name.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),),
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
