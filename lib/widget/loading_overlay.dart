import 'package:app_casynet/theme/app_colors.dart';
import 'package:app_casynet/widget/shimmer_loading.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget? shimmer;

  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
    this.shimmer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [

          if(this.shimmer != null) this.shimmer!,
          Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: kTextColor,
              ),
            ),
          )
        ],
      );
    }
    return child;
  }
}

