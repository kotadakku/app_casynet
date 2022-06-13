import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';

class CardChatItem extends StatelessWidget {
  final bool isFromMe;
  final String nameUser;
  final String message;
  const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameUser, required this.message, nameCompany, time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.only(left: isFromMe ? 30 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
        color: isFromMe ? Colors.blue.withOpacity(.1) : Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/account/image_user.png"),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(nameUser, style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blue,
                      // fontWeight: FontWeight.w400
                    ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: AppSize.iconSize, color: AppColors.yellowColor,),
                          Icon(Icons.star_outlined , size: AppSize.iconSize, color: AppColors.yellowColor,),
                          Icon(Icons.star_outlined , size: AppSize.iconSize, color: AppColors.yellowColor,),
                          Icon(Icons.star_outlined , size: AppSize.iconSize, color: AppColors.yellowColor,),
                          Icon(Icons.star_half_outlined , size: AppSize.iconSize, color: AppColors.yellowColor,),
                        ],
                      ),
                      SizedBox(width: 10.w,),
                      Text("10:30 03/30/2020",
                        style: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 12
                        ),

                      )
                    ],
                  ),

                  SizedBox(height: 10.h,),
                  Text(message)
                ],
              ))
        ],
      ),
    );
  }
}