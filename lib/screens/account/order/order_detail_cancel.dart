import 'package:app_casynet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../widget/account/order_cancel_widget.dart';
import '../../../widget/account/top_account_widget.dart';

class OrderDetailCancel extends StatelessWidget {
  const OrderDetailCancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAccountWidget(),
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
                            color: kTextColor,
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
                            color: kTextColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  )

                ],
              ),),
              Container(
                color: kYellowColor.withOpacity(0.1),
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
                          primary: kYellowColor
                      ),
                    ),
                  )

                ],
              ),),
              Container(color: kBackgroundColor, height: 10,),
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
                              color: kTextLink,
                              decoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Text("097474553",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 12
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text("Số 6/86 phùng khoang trung Văn Nam Từ Liêm, Hà Nội",
                      style: TextStyle(
                          color: kTextColor,
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
                        color: kTextColor
                      ),
                    ),
                    Text("Người bán tự vẫn chuyển")
                  ],
                ),
              ),
              Divider(
                color: kBackgroundColor,
                height: 20,
                thickness: 10,
              ),
              OrderCancelWidget(name_stores: ["Garage Minh Thức"]),
            ],
          ),
        ),
      ),
    );
  }
}
