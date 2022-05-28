

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../../data/model/seller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utlis/followed_convert.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import '../../../widgets/image_network_loading.dart';

class ProfileStoreWidget extends StatelessWidget {
  final DetailStoreController controller;
  ProfileStoreWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
                "assets/images/detail_store/background.png"),
            fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                    child: ClipOval(
                      child: ImageNetworkLoading(
                        image_url: controller.store.value.avatar_image.toString(),
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.fill,
                      )
                    )
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        controller.store.value.name.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Row(
                        children: [
                          Text(
                            controller.store.value.owner_shop??'',
                            style: TextStyle(color: kYellowColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(()=>Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: controller.isLive.value ? Colors.green : kYellowColor,
                                shape: BoxShape.circle),
                          ),),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Online 3 giờ trước",
                            style: TextStyle(color: kTextColor_gray),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.supervisor_account,
                            color: kYellowColor,
                            size: sizeIcon.width,
                          ),
                          Text(
                            "${FollowedConvert().followedConvert(controller.store.value.followed)} người theo dõi",
                            style: TextStyle(color: kTextColor_gray),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(child: Container(
                            height: 30,
                            child: Obx(()=>ElevatedButton(
                              onPressed: () {
                                controller.followed.value = !controller.followed.value;
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.share,
                                      color: controller.followed.value ? Colors.white : kYellowColor,
                                      size: sizeIcon.width,
                                    ),
                                  ),
                                  Text(
                                    "Theo dõi",
                                    style: TextStyle(
                                        color: controller.followed.value ? Colors.white : kYellowColor
                                    ),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: kYellowColor.withOpacity(controller.followed.value ? 1.0 : 0.0),
                                side: BorderSide(
                                    width: 1.0, color: kYellowColor),
                              ),
                            )),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Container(
                            height: 30,
                            padding: EdgeInsets.only(right: 10),
                            child: OutlinedButton(
                              onPressed: () {
                                Get.toNamed(Routes.MESSAGES);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.message_outlined,
                                      color: kYellowColor,
                                      size: sizeIcon.width,
                                    ),
                                  ),
                                  Text(
                                    "Chat",
                                    style: TextStyle(color: kYellowColor),
                                  )
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1.0, color: kYellowColor),
                              ),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
