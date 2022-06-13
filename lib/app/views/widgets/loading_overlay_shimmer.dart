import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'loading_overlay.dart';


class LoadingOverlayShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoadingAPI;
  final Widget? shimmer;
  final bool isLoadingDB;
  final String? error;
  final Function funcRetry;
  final Function funcSkip;


  const LoadingOverlayShimmer({
    Key? key,
    required this.isLoadingAPI,
    required this.isLoadingDB,
    required this.funcRetry,
    required this.funcSkip,
    this.shimmer,
    this.error,
    required this.child,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20.0.h),
        child: Stack(
          children: [
            child,
            (error == "" || error == null) ?
            SizedBox()
                : Positioned.fill(
                child: Container(
                  color: AppColors.backgroundColor.withOpacity(0.5),
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text("${error}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              child: Text('retry'.tr),
                              onPressed: () => funcRetry()
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                              child: Text('skip'.tr),
                              onPressed: () => funcSkip()
                          )
                        ],
                      )
                    ],
                  ),
                )
            ),
            isLoadingAPI ?
            Positioned.fill(child: Container(
                color: Colors.grey.withOpacity(0.3),
                padding: EdgeInsets.only(top: 100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator.adaptive(),
                )
            )) : SizedBox()
          ],
        )
    );
  }
}

