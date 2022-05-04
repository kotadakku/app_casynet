
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/detail_app_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
import 'benefit/benefit_owner.dart';
import 'benefit/benefit_store.dart';
import 'home/widgets/appbar_home_widget.dart';

class DetailAppPage extends StatelessWidget {
  const DetailAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isExpandCasyney = Get.find<DetailAppController>().isExpandCasyney;
    var isExpandBenefit = Get.find<DetailAppController>().isExpandBenefit;
    var isExpandPolicy = Get.find<DetailAppController>().isExpandPolicy;
    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: kBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.h),
              child: Row(
                children: [
                  SizedBox(
                      width: 30,
                      child: Icon(
                        Icons.help,
                        color: Colors.blue,
                        size: sizeIcon.height,
                      ),
                  ),
                  Text(
                    "Thông tin cần thiết",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Về Casynet
            Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Về Casynet",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Obx(()=>
                            Container(
                              height: 30,
                              child: Icon(
                                isExpandCasyney.value
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: sizeIcon.height,
                                color: kTextColor_gray,
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    isExpandCasyney.value = !isExpandCasyney.value;
                  },
                ),
                Divider(
                  thickness: 1,
                ),
                Obx(()=>Visibility(
                    visible: isExpandCasyney.value,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Chính sách bán hàng",
                                  style:
                                  TextStyle(color: kTextColor_gray),
                                ),
                                Container(
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        Divider(indent: 10, thickness: 1),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Điều khoản sử dụng",
                                  style:
                                  TextStyle(color: kTextColor_gray),
                                ),
                                Container(
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        Divider(indent: 10, thickness: 1),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Chính sách bảo mật",
                                  style:
                                  TextStyle(color: kTextColor_gray),
                                ),
                                Container(
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        Divider(indent: 10, thickness: 1),
                      ],
                    )),),

              ],
            ),
            // Hợp tác chủ xe

            Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hợp tác chủ xe",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Obx(()=>
                            Container(
                              height: 30,
                              child: Icon(
                                isExpandBenefit.value
                                    ? Icons.keyboard_arrow_up_sharp
                                    : Icons.keyboard_arrow_down_sharp,
                                size: sizeIcon.width,
                                color: kTextColor_gray,
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    isExpandBenefit.value = !isExpandBenefit.value;
                  },
                ),
                Divider(
                  thickness: 1,
                ),
                Obx(()=>
                    Visibility(
                        visible: isExpandBenefit.value,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lợi ích cho chủ của hàng",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                        height: 30,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: kTextColor_gray,
                                        )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Get.to(BenefitStore());
                              },
                            ),
                            Divider(indent: 10, thickness: 1),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lợi ích cho chủ xe",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor_gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Get.to(BenefitOwner());
                              },
                            ),
                            Divider(indent: 10, thickness: 1),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Quảng cáo với Casynet",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor_gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            Divider(indent: 10, thickness: 1),
                          ],
                        ))
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hỗ trợ tư vấn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Obx(()=>
                            Container(
                              height: 30,
                              child: Icon(
                                isExpandPolicy.value
                                    ? Icons.keyboard_arrow_up_sharp
                                    : Icons.keyboard_arrow_down_sharp,
                                size: sizeIcon.height,
                                color: kTextColor_gray,
                              ),
                            ),
                        )

                      ],
                    ),
                  ),
                  onTap: () {
                    isExpandPolicy.value = !isExpandPolicy.value;
                  },
                ),
                Divider(
                  thickness: 1,
                ),
                Obx(()=>
                    Visibility(
                        visible: isExpandPolicy.value,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Chính sách vận chuyển",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor_gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            Divider(indent: 10, thickness: 1),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hướng dẫn bán hàng",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor_gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            Divider(indent: 10, thickness: 1),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hướng dẫn mua hàng",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            Divider(indent: 10, thickness: 1),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tin tức",
                                      style:
                                      TextStyle(color: kTextColor_gray),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kTextColor_gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            Divider(indent: 10, thickness: 1),
                          ],
                        )
                    )
                )
              ],
            )
            // Hỗ trợ tư vấn
          ],
        ),
      ),
    );
  }
}
