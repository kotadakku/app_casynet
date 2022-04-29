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
          if(this.shimmer != null) this.shimmer! else child,
          Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      );
    }
    return child;
  }
}

