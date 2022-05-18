import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shimmer_loading.dart';

class PromotionBlurWidget extends StatelessWidget {
  const PromotionBlurWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
          4, (index) => Container(
        width: ScreenUtil().screenWidth/4,
        height: 80,
        child: Column(
          children: [
            ShimmerLoading(isLoading: true,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),),
            SizedBox(height: 10,),
            ShimmerLoading(isLoading: true, child: Container(
              height: 10,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),)

          ],
        ),
      )
      ),

    );
  }
}