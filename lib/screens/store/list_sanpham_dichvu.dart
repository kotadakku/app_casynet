
import 'package:app_casynet/screens/store/themsanphamdichvu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../widget/home/reservation_home_widget.dart';
import '../../controller/store/datetime_range_controller.dart';


class SanPhamDichVu extends StatelessWidget {
  const SanPhamDichVu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTimeRangeController QLDTController =
        Get.put(DateTimeRangeController());

    RxBool isImageHide = false.obs;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          "Danh sách sản phẩm/ dịch vụ",

        ),
        actions: [
          InkWell(
              onTap: (){
                Get.to(ThemSanPhamDichVu());
              },
              child: Container(margin: EdgeInsets.only(right: 10.0.w),
                child: Icon(CupertinoIcons.add_circled, ),)
          )

        ],

      ),
      body: SafeArea(
        child:  DefaultTabController(
            length: 5,
            child: Column(
              children: [
                Container(
                    height: 50.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 500,
                              child: const TabBar(
                                labelColor:
                                Color.fromARGB(255, 223, 180, 0),
                                unselectedLabelColor: Colors.grey,
                                indicatorColor:
                                Color.fromARGB(255, 223, 180, 0),
                                tabs: [
                                  Tab(
                                    child: Text("Tất cả"),
                                  ),
                                  Tab(
                                    child: Text("Còn hàng"),
                                  ),
                                  Tab(
                                    child: Text("Hết hàng"),
                                  ),
                                  Tab(
                                    child: Text("Đã bị khóa"),
                                  ),
                                  Tab(
                                    child: Text("Bị ẩn"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          /* Lọc sản phẩm */
                          Container(
                            color: const Color.fromARGB(255, 241, 243, 253),
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "4 sảm phẩm ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/store/ic_filter.svg",
                                          width: 30),
                                    ],
                                  ),
                                  // style: TextButton.styleFrom(
                                  //   side: BorderSide(width: 0.0, color: Colors.white)
                                  // ),
                                )

                                /*InkWell(
                                            splashColor: Color.fromARGB(
                                                255, 188, 195, 216),
                                            onTap: () {
                                              QLDTController.chooseDateRangePicker();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                SvgPicture.asset("assets/store/ic_filter.svg", width: 30,),
                                              ],
                                            ),
                                          ),*/
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          /* Danh sách sản phẩm*/
                          Expanded(
                            child: LayoutBuilder(
                                builder: (context, constraints) {
                                  var size = 2;
                                  if (constraints.maxWidth > 600)
                                    size = 4;
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: 20,
                                    // physics:
                                    //     NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: size,
                                        crossAxisSpacing: 0.5,
                                        mainAxisSpacing: 5.0.w,
                                        childAspectRatio: 0.7
                                    ),
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Container(
                                          margin: EdgeInsets.only(
                                            left: 5.0.w,
                                            right: 5.0.w,
                                          ),
                                          height: 400,
                                          width: 250,
                                          color: Colors.white,
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      /*ảnh sản phẩm*/
                                                      Container(
                                                        height: 200,
                                                        width: 250,
                                                        child: SvgPicture.asset(
                                                          "assets/store/img_sanpham.svg",
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      /* % giảm giá */
                                                      if (7 != null)
                                                        const Positioned(
                                                            right: 5,
                                                            top: 5,
                                                            child: ItemAddPoint(
                                                                color:
                                                                Colors.red,
                                                                width: 50,
                                                                point: 10)),
                                                      /* Điểm cộng */
                                                      if (20 != null)
                                                        const Positioned(
                                                            top: 5,
                                                            left: 5,
                                                            child: ItemSale(
                                                                color:
                                                                kYellowColor,
                                                                width: 40,
                                                                sale: 30))
                                                    ],
                                                    // Image.asset("")
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Expanded(
                                                          child: Text(
                                                            "Máy rửa xe Catorex - CTR",
                                                            maxLines: 2,
                                                          ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: const [
                                                      Text(
                                                        "100.290.000 đ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 13),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "1.390.000",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                            color:
                                                            Color.fromARGB(
                                                                255,
                                                                153,
                                                                153,
                                                                153)),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Tên cửa hàng",
                                                        style: TextStyle(
                                                            color:
                                                            Color.fromARGB(
                                                                255,
                                                                153,
                                                                153,
                                                                153)),
                                                      ),
                                                      PopupMenuButton(
                                                          elevation: 20,//độ nổi của nút
                                                          enabled: true, //đươc kích hoạt
                                                          offset: const Offset(0, 0),// vị trí hiện nút

                                                          child: const Icon(
                                                            Icons.more_horiz,
                                                            color: kTextColor,
                                                          ),
                                                          onSelected: (value) {
                                                            switch (value) {
                                                              case 'home':
                                                                isImageHide.value = !isImageHide.value;
                                                                break;
                                                              case 'product':
                                                                Get.toNamed(
                                                                    '/product/seen_product');
                                                                break;
                                                              case 'account':
                                                                Get.toNamed(
                                                                    '/account/login');
                                                            }
                                                          },
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              child:
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                    Image.asset(
                                                                      "assets/store/ic_eye_slash.png",
                                                                      color: kTextColor,
                                                                      width: 20,
                                                                      height: 20,
                                                                    ),
                                                                    padding:
                                                                    const EdgeInsets.only(bottom: 15, right: 10),
                                                                  ),
                                                                  Expanded(
                                                                      child: Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: const [
                                                                          Text(
                                                                            "Ẩn",
                                                                            style: TextStyle(color: kTextColor),
                                                                          ),
                                                                          Divider(
                                                                            color: kTextColor,
                                                                            height: 20,
                                                                            thickness: 1,
                                                                          ),
                                                                        ],
                                                                      ))
                                                                ],
                                                              ),
                                                              value:
                                                              "home",
                                                            ),
                                                            PopupMenuItem(
                                                              child:
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                    Image.asset(
                                                                      "assets/store/ic_trash.png",
                                                                      color: kTextColor,
                                                                      width: 20,
                                                                      height: 20,
                                                                    ),
                                                                    padding:
                                                                    const EdgeInsets.only(bottom: 15, right: 10),
                                                                  ),
                                                                  Expanded(
                                                                      child: Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: const [
                                                                          Text(
                                                                            "Xóa",
                                                                            style: TextStyle(color: kTextColor),
                                                                          ),
                                                                          Divider(
                                                                            color: kTextColor,
                                                                            height: 20,
                                                                            thickness: 1,
                                                                          ),
                                                                        ],
                                                                      ))
                                                                ],
                                                              ),
                                                              value:
                                                              "product",
                                                            ),
                                                            PopupMenuItem(
                                                              child:
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                    Image.asset(
                                                                      "assets/store/ic_edit.png",
                                                                      color: kTextColor,
                                                                      width: 20,
                                                                      height: 20,
                                                                    ),
                                                                    padding:
                                                                    const EdgeInsets.only(bottom: 15, right: 10),
                                                                  ),
                                                                  Expanded(
                                                                      child: Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: const [
                                                                          Text(
                                                                            "Sửa",
                                                                            style: TextStyle(color: kTextColor),
                                                                          ),
                                                                          Divider(
                                                                            color: kTextColor,
                                                                            height: 20,
                                                                            thickness: 1,
                                                                          ),
                                                                        ],
                                                                      ))
                                                                ],
                                                              ),
                                                              value:
                                                              "account",
                                                            ),
                                                          ])
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Obx(()=>Visibility(
                                                  visible: isImageHide.value,
                                                  child: Positioned.fill(
                                                    child: Container(
                                                      color: Colors.black.withOpacity(0.5),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons.lock, color: Colors.white, size: 40,),
                                                          Text("Đã ẩn",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white
                                                            ),
                                                          ),
                                                          OutlinedButton(
                                                            child: Text("Hiển thị",
                                                              style: TextStyle(
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                            onPressed: (){
                                                              isImageHide.value = !isImageHide.value;
                                                            },
                                                            style: OutlinedButton.styleFrom(
                                                                side: BorderSide(
                                                                    color: Colors.white,
                                                                    width: 1
                                                                )
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              )
                                              )
                                            ],
                                          )
                                        // child: ,
                                      );
                                    },
                                  );
                                }),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.only(left: 10, right: 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: kYellowColor,
                                  value: true, onChanged: (value) {  },),
                                SizedBox(width: 5,),
                                Text("Chọn tất cả", style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Text("36363636"),
                      const Text("66666663"),
                      const Text("33333333"),
                      const Text("66666666"),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
