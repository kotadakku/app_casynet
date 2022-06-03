
import 'package:flutter/material.dart';

import '../widgets/appbar_account_widget.dart';
import '../widgets/order_cancel_widget.dart';
import '../../../theme/app_colors.dart';


class OrderDetailComplete extends StatelessWidget {
  const OrderDetailComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarAccountWidget(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("Chi tiết đơn đã hủy",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.all(10), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ID ĐƠN HÀNG: 372302050"),
                      Text("ĐÃ HỦY",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),),
                  Divider(),
                  Padding(padding: EdgeInsets.all(10), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Đơn hàng đã đặt"),
                          Text("01:08 12-02-2020",
                            style: TextStyle(
                                color: AppColors.textGrayColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Đơn hàng đã bị hủy"),
                          Text("11:08 12-02-2020",
                            style: TextStyle(
                                color: AppColors.textGrayColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      )

                    ],
                  ),),
                  Container(
                    color: AppColors.yellowColor.withOpacity(0.1),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Bạn đã hủy đơn hàng này"),
                        SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text("Mua lần nữa"),
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.yellowColor
                            ),
                          ),
                        )

                      ],
                    ),),
                  Container(color: AppColors.backgroundColor, height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("Địa chỉ nhận hàng",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Nguyễn Thị Bích",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Sửa",
                                style: TextStyle(
                                    color: AppColors.textLink,
                                    decoration: TextDecoration.underline
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text("097474553",
                            style: TextStyle(
                                color: AppColors.textGrayColor,
                                fontSize: 12
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Số 6/86 phùng khoang trung Văn Nam Từ Liêm, Hà Nội",
                            style: TextStyle(
                                color: AppColors.textGrayColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      )
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Không có thông tin vận chuyển",
                          style: TextStyle(
                              color: AppColors.textGrayColor
                          ),
                        ),
                        Text("Người bán tự vẫn chuyển")
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.backgroundColor,
                    height: 20,
                    thickness: 10,
                  ),
                  OrderCancelWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
