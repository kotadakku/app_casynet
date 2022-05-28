import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/image_network_loading.dart';

class CategoryItemBottom extends StatelessWidget {
  final String images_url;
  final String name;
  final int id;

  const CategoryItemBottom(
      {Key? key, required this.images_url, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: LayoutBuilder(builder: (context, constraint) {
        var width = constraint.maxWidth > 785
            ? (constraint.maxWidth / 3 - 20)
            : (constraint.maxWidth / 2 - 15);
        return Container(
            width: width,
            height: 42,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1, color: kYellowColor)),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/images/home/category/left_bottom.svg",
                            height: 40,
                            // fit: BoxFit.cover,
                          ),),
                        Positioned(
                            left: 10,
                            top: 10,
                            child: ImageNetworkLoading(image_url:images_url,  width: 16, height: 16,)
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      child: Text(
                        name,
                        style: TextStyle(color: kTextColor_gray, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ));
      }),
      onTap: () {
        Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [name, id]);
      },
    );
  }
}