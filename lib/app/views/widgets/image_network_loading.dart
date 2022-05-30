
import 'package:app_casynet/app/views/widgets/shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkLoading extends StatelessWidget {
  final String image_url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageNetworkLoading({Key? key, required this.image_url, this.fit, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image_url,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => SizedBox(
        height: 20,
        width: 20,
        child: Stack(
          children: [
            ShimmerLoading(
              isLoading: true,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  // borderRadius: BorderRadius.circular(),
                ),
              ),
            ),
          ],
        ),
      ),
      errorWidget: (context, url, error) => Image.asset("assets/images/image_holder.png"),
    );
  }
}
