import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shimmer_loading.dart';

class ItemSellerShimmer extends StatelessWidget {
  const ItemSellerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
          spacing: 5.0.w,
          runSpacing: 10.0,
          children:  List.generate(12, (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 120.w,
                  width:  0.5.sw - 7.5.w,
                  margin: EdgeInsets.only(bottom: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.5.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.2.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.3.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          )
          )
      ),
    );
  }
}