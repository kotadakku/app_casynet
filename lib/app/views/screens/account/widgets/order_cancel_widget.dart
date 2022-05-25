import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/account/api/order_controller.dart';
import '../../../../controller/account/order_account_controller.dart';
import '../../../../data/model/product.dart';
import '../../../theme/app_colors.dart';
import 'order_canceled_widget.dart';

class OrderCancelWidget extends StatelessWidget {
  OrderController _orderController = Get.find();
  OrderAccountController _orderAccountController = Get.find();
  OrderCancelWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _orderController.obx((state) => ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: state.length+1,
      shrinkWrap: true,
      itemBuilder: (context, index){
        if(index < state.length)
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
                          state[index].nameStore.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kTextLink),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.chat_bubble_2,
                          color: kYellowColor,
                        ),
                        Spacer(),
                        if(state[index].status == 'canceled')
                        Text('ĐÃ HỦY',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                ),
                Divider(),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state[index].products?.length,
                    itemBuilder: (context, i){
                      return  OrderItem(
                        product: state.value[index].products[i],
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
        else return Obx(()=>_orderAccountController.isLoadingAll.value ?
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
            _orderAccountController.loadMoreAll();
          },
        ));
      }
    ));
  }
}
