import 'package:app_casynet/controller/cuahang_controller.dart';
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_colors.dart';

/* */
class StoreWidget extends StatelessWidget {
  StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: CircleAvatar(
                        child: Text(
                          "123",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xffDFB400),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Cửa hàng".toUpperCase(),
                      style: TextStyle(
                          color: Color(0xffDFB400),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Xem thêm",
                      style: TextStyle(
                        color: Color(0xffB7BAC1),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      "assets/home/store/icon_xemthem.svg",
                      width: 5,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
            child: Container(
              color: Color(0xffF1F3FD),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GetBuilder<CuaHangController>(
                      init: CuaHangController(),
                      builder: (controller){
                    return Row(
                      children: [
                        Radio(
                            value: true,
                            groupValue:
                            controller.isCar,
                            onChanged: (value) {
                              controller.updateIsCar(controller.isCar);
                              controller.updateAPI();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Ô tô"),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                            value: false,
                            groupValue: controller.isCar,
                            onChanged: (value) {
                              controller.updateIsCar(controller.isCar);
                              controller.updateAPI();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Xe máy")
                      ],
                    );
                  })
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.toNamed(Routes.FILTER_MAP);
                },

                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/home/store/icon_filter.svg",
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Lọc",
                      style: TextStyle(
                        color: Color(0xffB7BAC1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              )

            ],
          ),
          GetBuilder<CuaHangController>(
              init: CuaHangController(),
              builder: (controller) {
                return Wrap(
                    spacing: 5.0,
                    runSpacing: 10.0,
                    children: controller.cuahangList.map((e) =>
                        ItemCuaHangWidget(
                          id: e.idcuahang.toString(),
                          store_image: e.anhsanpham.toString(),
                          distance: double.parse(
                              e.khoangcachtoicuahang.toString()),
                          store_name: e.tencuahang.toString(),
                          address: e.diachicuahang.toString(),
                          quality: int.parse(e.slchiase.toString()),
                          comment: int.parse(e.slbinhluan.toString()),
                          like: int.parse(e.slthich.toString()),
                        ))
                        .toList());
              })
        ],
      ),
    );
  }
}

class ItemCuaHangWidget extends StatelessWidget {
  final String id;
  final String store_image;
  final String store_name;
  final int like;
  final int comment;
  final int quality;
  final String address;
  final double distance;

  const ItemCuaHangWidget({
    Key? key,
    required this.store_image,
    required this.store_name,
    required this.address,
    required this.distance,
    required this.like,
    required this.comment,
    required this.quality,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) =>
          Container(
            width: constraint.maxWidth / 2 - 7.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      print(id);
                      if (id != null) Get.toNamed(
                          Routes.STORE_DETAIL, arguments: { 'store_Id': id});
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      height: 120,
                      width: constraint.maxWidth / 2 - 7.5,
                      child: Image.network(
                        store_image,
                        fit: BoxFit.fill,
                      ),
                    )),
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
                          Text(like.toString(), style: TextStyle(fontSize: 13))
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
                          Text(comment.toString(),
                              style: TextStyle(fontSize: 13))
                        ],
                      ),
                      Row(
                        children: [


                          Text(quality.toString(),
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
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print(id);
                          if (id != null) Get.toNamed(Routes.STORE_DETAIL,
                              arguments: { 'store_Id': id});
                          FocusScope.of(context).unfocus();
                        },
                        child: Text(
                          store_name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.phoneFlip,
                      color: kTextColor_gray,
                      size: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
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
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Expanded(
                              child: Text(
                                address,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationArrow,
                          color: kTextColor_gray,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "$distance km",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
    );
  }
}
