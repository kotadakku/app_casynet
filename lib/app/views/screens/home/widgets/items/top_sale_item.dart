import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/image_network_loading.dart';

class CardItem extends StatelessWidget {
  final String image_url;
  final String title;
  const CardItem({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          var divide = ScreenUtil().screenWidth>=750 ? 5 : 4;
          return Container(
            height: 80,
            width: ScreenUtil().screenWidth/divide,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ImageNetworkLoading(
                    image_url: image_url,
                  ),
                ),

                SizedBox(height: 10,),
                Text(title),
              ],
            ),
          );
        }
    );
  }
}