import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import 'package:app_casynet/app/data/data.dart';

class CardChatItem extends StatelessWidget {
  final Rate rate;
  const CardChatItem({Key? key, required this.rate,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
          margin: EdgeInsets.only(left: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.blueAccent),
                    image: DecorationImage(
                      image: NetworkImage('${rate.avatar}'),
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
                        child: Text('${rate.userName}', style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.blue,
                          // fontWeight: FontWeight.w400
                        ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: rate.rateTotal ?? 0.0,
                            unratedColor: Colors.amber.withOpacity(0.2),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 18.0,
                            direction: Axis.horizontal,
                          ),

                          SizedBox(width: 10.w,),
                          Text('${rate.rateTotal}',
                            style: TextStyle(
                                color: AppColors.textGrayColor,
                                fontSize: 12
                            ),

                          )
                        ],
                      ),

                      SizedBox(height: 10.h,),
                      Text('${rate.content}')
                    ],
                  ))
            ],
          ),
        ),
       rate.reply != null ?  Container(
         padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
         margin: EdgeInsets.only(left: 30),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
           color: Colors.blue.withOpacity(.1),
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
                     image: NetworkImage('${rate.reply?.avatar}'),
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
                       child: Text('${rate.reply?.userName}', style: TextStyle(
                         overflow: TextOverflow.ellipsis,
                         color: Colors.blue,
                         // fontWeight: FontWeight.w400
                       ),
                       ),
                     ),
                     SizedBox(height: 10.h,),
                     Text('${rate.reply?.content}')
                   ],
                 )
             )
           ],
         ),
       ) : SizedBox()
      ],
    );
  }
}