
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class DataStorePage extends StatelessWidget {
  const DataStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Dữ liệu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.add, color: AppColors.yellowColor,),
                          Text("100", style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text('product'.tr,
                        style: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add, color: AppColors.yellowColor,),
                          Text("145", style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text('transactions'.tr,
                        style: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add, color: AppColors.yellowColor,),
                          Text("75%", style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Text('response_rate'.tr,
                        style: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 18
                        ),
                      )

                    ],
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
              child: Column(
                children: [
                  _buildItem(title: 'turnover'.tr,color: Colors.blue,trailing: 'đ 50.000.000'),
                  _buildItem(title: "Đơn hàng",color: Colors.green,trailing: '50'),
                  _buildItem(title: "Tỷ lệ chuyển đổi",color: Colors.yellow,trailing: '0.00%'),
                  _buildItem(title: "Doanh thu/Đơn",color: Colors.red,trailing: '50'),
                  _buildItem(title: "Lượt truy cập",color: Colors.orange,trailing: '0'),
                  _buildItem(title: "Lượt xem",color: Colors.deepPurpleAccent,trailing: '50')
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildItem({title, color, trailing}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Material(
        elevation: 0.5,
        child: Container(
          padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, right: 15.0.w),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.0)
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(right: 10.0.w),
                child: Icon(Icons.add,
                  color: color,
                ),
              ),
              Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(trailing,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
