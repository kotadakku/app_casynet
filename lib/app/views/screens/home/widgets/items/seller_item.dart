
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../controller/home/cuahang_controller.dart';
import '../../../../../data/model/seller.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_sizes.dart';
import '../../../../widgets/image_network_loading.dart';

class ItemSellerWidget extends StatelessWidget {
  final Seller store;

  const ItemSellerWidget({
    Key? key,
    required this.store
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CuaHangController controller = Get.put(CuaHangController());
    return LayoutBuilder(builder: (context, constraints) {
      var divide = constraints.maxWidth > 785? 3: 2;
      return Container(
        width:  (1/divide).sw - 7.5.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  if (store != null) Get.toNamed(
                      Routes.STORE_DETAIL, arguments: { 'store': store});
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  height: 120.w,
                  width:  (1/divide).sw - 7.5.w,
                  child: ImageNetworkLoading(
                    image_url: store.imageUrl.toString(),
                    fit: BoxFit.fill,
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              color: Color(0xffEFF1FC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_rounded,
                        color: kTextColor_gray,
                        size: IconSize.iconSize,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(this.store.likeQty == null ? '0': store.likeQty.toString(), style: TextStyle(fontSize: 13))
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.comment,
                        size: IconSize.iconSize,
                        color: kTextColor_gray,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(store.commentQty == null ? '0' : store.commentQty.toString(),
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                  Row(
                    children: [
                      Text(store.rate == null ? '0.0' : store.rate.toString(),
                          style: TextStyle(fontSize: 15)
                      ),
                      SizedBox(
                        width: 2,
                      ),

                      Icon(
                        Icons.star_outlined,
                        color: kTextColor_gray,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (store != null) Get.toNamed(
                          Routes.STORE_DETAIL, arguments: { 'store': store});
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      store.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp
                      ),
                    ),
                  ),
                ),
                GestureDetector(

                  onTap: (){
                    controller.callPhone(store.phone.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.phoneFlip,
                      color: kTextColor_gray,
                      size: IconSize.iconSize,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapLocationDot,
                        color: kTextColor_gray,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3.0.w,
                      ),
                      Expanded(
                          child: Text(
                            store.address == null? 'Chưa có thông tin' :
                            store.address.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.sp),
                          ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationArrow,
                      color: kTextColor_gray,
                      size: 15.0,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${store.distance == null? 0.0: store.distance} km",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}