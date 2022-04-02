
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class InformationStoreWidget extends StatelessWidget {
  const InformationStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 20,),
        ListTile(
          leading: CircleAvatar(
            child: Text("123"),
          ),
          title: Text("CÔNG TY TNHH Ô TÔ MỸ ĐÌNH THC"),
          subtitle: Row(
            children: [
              Text("bulary 12019", style: TextStyle(
                color: kYellowColor
              ),),
              SizedBox(width: 10,),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: kYellowColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text("Hoạt động cách đây 3 giờ trước",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 12
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("2000", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Sản phẩm")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("75%", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Tỉ lệ phản hồi")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                      Text("145", style: TextStyle(
                          color: kYellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Giao dịch")
                ],
              )
            ],
          )
        ),
        Row(
          children: [
            Flexible(child: Container(
              height: 30,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, color: kYellowColor, size: sizeIcon.width,),
                    SizedBox(width: 5,),
                    Text("Theo dõi",
                      style: TextStyle(
                          color: kYellowColor
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: kYellowColor,
                    side: BorderSide(
                      color: kYellowColor,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                ), onPressed: () {  },
              ),
            ),),
            SizedBox(width: 10,),
            Flexible(child:  Container(
              height: 30,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share, size: sizeIcon.width,),
                    SizedBox(width: 5,),
                    Text("Xem cửa hàng",
                      style: TextStyle(
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: kYellowColor,

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                ), onPressed: () {  },
              ),
            ),),
          ],
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
