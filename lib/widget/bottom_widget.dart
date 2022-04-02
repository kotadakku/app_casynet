
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 60,
                height: 60,
                color: kYellowColor,
                child: SvgPicture.asset("assets/home/logo.svg"),
              ),
              SizedBox(width: 10,),
              //
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Tải ngay ứng dụng",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children : [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Cài đặt ứng dụng Casynet miễn phí",
                              style: TextStyle(
                                fontSize: 11,
                                color: kTextColor
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(padding: EdgeInsets.only(right: 20), child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image.asset(name)
                                Row(
                                  children: [
                                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                    Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                    Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                                  ],
                                ),
                                Expanded(child:Text("38.000 bình chọn",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: kTextColor
                                  ),
                                ))
                                ,
                              ],
                            )),
                          ],
                        )
                        ),
                          ElevatedButton(
                              onPressed: (){},
                              child: Text("Cài đặt")
                          )
                        ]
                    )
                  ],
              )
              )
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Text('Giới thiệu  -  Thông tin cần thiết  -  Liên hệ',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              SizedBox(height: 20,),
              Image.asset("assets/home/dadangky.png", width: 200,),
              SizedBox(height: 20,),
              Text('Công ty cổ phần đầu tư Bác Thủ Đô',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Text('Copyright @2020 casynet',
                style: TextStyle(
                  fontSize: 12,
                  color: kTextColor
              ),
              ),
            ],
          )
        ],
      )
    );
  }
}
