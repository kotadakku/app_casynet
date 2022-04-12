import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../widget/home/reservation_home_widget.dart';
import 'datetime_range_controller.dart';


class SanPhamDichVu extends StatelessWidget {
  const SanPhamDichVu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTimeRangeController QLDTController =
        Get.put(DateTimeRangeController());
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Danh sách sản phẩm/ dịch vụ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/store/ic_plus.svg",
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Expanded(
                  child: DefaultTabController(
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
                                      padding: const EdgeInsets.all(10.0),
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
                                                    width: 40),
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
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: size,
                                            crossAxisSpacing: 0.5,
                                            mainAxisSpacing: 5.0,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                              ),
                                              height: 180,
                                              width: 200,
                                              color: Colors.white,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      /*ảnh sản phẩm*/
                                                      Container(
                                                        height: 100,
                                                        child: SvgPicture.asset(
                                                          "assets/store/img_sanpham.svg",
                                                          fit: BoxFit.fitWidth,
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
                                                        "Máy rửa xe Catorex - CTR gggggggggggggggg",
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
                                                          elevation: 20,
                                                          enabled: true,
                                                          offset: const Offset(0, 0),
                                                          // điểm xuất phát
                                                          child: const Icon(
                                                            Icons.more_horiz,
                                                            color: kTextColor,
                                                          ),
                                                          onSelected: (value) {
                                                            switch (value) {
                                                              case 'home':
                                                                Get.toNamed(
                                                                    '/home');
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
                                        children: const [
                                          Icon(
                                            Icons.check_box_outlined,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("Chọn tất cả", style: TextStyle(fontSize: 15),)
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
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
