
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../routes/app_pages.dart';
import '../../app/views/theme/app_colors.dart';
import '../../widgets/account/appbar_account_widget.dart';
import '../theme/app_colors.dart';

class FollowedStorePage extends StatelessWidget {
  const FollowedStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarAccountWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 10.0.h),
            child: Text(
              "Cửa hàng theo dõi",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(
            thickness: 10.h,
            color: kBackgroundColor,
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, index){
              return Divider();
            },
            itemBuilder: (context, index) => Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text("1232") ,
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gara Ô Tô Hà Nội Car Sevices",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5.0.h,),
                              Text("số 2 Phố Trần Hữu Dực, Mỹ Đình, Từ Liêm, Hà Nội",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: kTextColor_gray
                                ),
                              ),
                              Container(
                                height: 30,
                                margin: EdgeInsets.only(top: 5.0.h),
                                child: Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: (){
                                        Get.toNamed(Routes.STORE_DETAIL);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: kTextColor,
                                        ),
                                        primary: kYellowColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(2.0),
                                            child: Icon(Icons.add, color: kTextColor,),
                                          ),
                                          Text("Vào cửa hàng",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                    SizedBox(width: 5.0.w,),
                                    OutlinedButton(
                                        onPressed: (){},
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Colors.red),
                                          onSurface: Colors.red,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(2.0),
                                              child: Icon(Icons.add, color: Colors.red,),
                                            ),
                                            Text("Bỏ theo dõi",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )

                            ],
                          ),
                        )
                    )
                  ],
                )
            ), itemCount: 3,),
        ],
      ),
    );
  }
}
