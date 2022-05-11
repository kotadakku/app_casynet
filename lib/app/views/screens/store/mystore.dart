
import 'package:app_casynet/app/views/screens/store/gift_store_page.dart';
import 'package:app_casynet/app/views/screens/store/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'data_store_page.dart';
import 'edit_mystore.dart';
import 'sanpham_dichvu.dart';
import 'notications_customer.dart';
import 'quan_ly_doanh_thu.dart';
import 'quan_ly_don_hang.dart';
import 'question_answer.dart';
import 'rate_store_page.dart';
import 'setting_notications.dart';
import 'themsanphamdichvu.dart';

class MyStorePage extends StatelessWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Get.back();},
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Cửa hàng của tôi"),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 5),
            child: GestureDetector(
              onTap: () {
                print("1234");
                // Get.off(NewCreatedStore());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/bottom_navi_icon/noti.svg",
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: GestureDetector(
              onTap: () {
                // Get.off(NewCreatedStore());
                print("kkkS");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageIcon(
                    AssetImage("assets/store/ic_question_circle.png"),
                    size: 20,
                  )
                ],
              ),
            ),
          )
        ],

      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                child: Stack(
                  clipBehavior: Clip.none, //
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Image.asset(
                              "assets/store/img_74.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            // color: Colors.black26,
                            alignment: Alignment.center,
                            height: 50,
                            child: const Text(
                              "Công ty TNHH Thế Bảo",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //     top: 10,
                    //     right: 10,
                    //     // left: 250.0,
                    //     child: TextButton(
                    //       style: TextButton.styleFrom(
                    //         backgroundColor:
                    //         const Color.fromARGB(255, 195, 164, 43).withOpacity(0.5),
                    //       ),
                    //       onPressed: () {
                    //         Get.to(EditMyStore());
                    //       },
                    //       child: const Text(
                    //         "Sửa cửa hàng",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     )),
                    Positioned(
                      left: 20,
                      bottom: MediaQuery.of(context).size.height / 50,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 223, 180, 0),
                              width: 2,
                            ),
                            image: const DecorationImage(
                              image: ExactAssetImage(
                                  "assets/store/img_mask_group_14.png"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
              ),
// quản lý doanh thu
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_REVENUE);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: const Icon(Icons.money_sharp),
                          ),
                          const Text("Quản lý doanh thu",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black))
//
                        ],
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
// Quản lý đơn hàng
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.to(QuanLyDonHang());
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: const Icon(Icons.money_sharp),
                          ),
                          const Text("Quản lý đơn hàng",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black))
                        ],
                      ),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 10,
              ),
// Quản lý sản phẩm
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_PRODUCT);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: const Icon(Icons.money_sharp),
                          ),
                          const Text("Quản lý sản phẩm",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black))
//
                        ],
                      ),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Danh sách sản phẩm/Dịch vụ
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.to(SanPhamDichVu());
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Danh sách sản phẩm/Dịch vụ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Thêm sản phẩm dịch vụ
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.to(ThemSanPhamDichVu());
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Thêm sản phẩm dịch vụ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.navigate_next),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //////////////////
              const Divider(
                height: 5,
                thickness: 10,
              ),
// Kênh marketing
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(Icons.money_sharp),
                        ),
                        const Text("Kênh marketing",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
              ),
//Quà tặng cửa hàng
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_GIFT);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Quà tặng cửa hàng",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Thông báo tới khách hàng
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_NOTI);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Thông báo tới khách hàng",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              ////
              const Divider(
                height: 5,
              ),
//Quản lý Casycoin
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Quản lý Casycoin",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Quảng cáo với Casynet
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Quảng cáo với Casynet",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),

              //////////////////
              const Divider(
                height: 5,
                thickness: 10,
              ),
// Quản lý cửa hàng
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(Icons.money_sharp),
                        ),
                        const Text("Quản lý cửa hàng",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
              ),
//Đánh giá
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.to(RateStorePage());
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Đánh giá",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),

//Hỏi đáp
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_QA);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Hỏi đáp",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              ////
              const Divider(
                height: 5,
              ),
//Tin Tức
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_NEWS);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Tin Tức",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Dữ liệu
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_DATA);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Dữ liệu",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 10,
              ),
// Cài đặt cửa hàng
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(Icons.money_sharp),
                        ),
                        const Text("Cài đặt cửa hàng",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 5,
              ),
//Thiết lập thông tin
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Thiết lập thông tin",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),

                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
              ),
//Cài đặt thông báo
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.toNamed(Routes.MY_STORE_SETTINGS);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Cài đặt thông báo",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))
                            ],
                          )),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 10,
              ),
// btn Đăng xuất
              Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                alignment: const Alignment(0, 0),
                                side: const BorderSide(
                                    width: 1.0,
                                    color:
                                    Color.fromARGB(255, 223, 180, 0)),
                                // padding: EdgeInsets.only(left: 10, right: 10),
                                backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                // Get.to();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Đăng xuất',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      Color.fromARGB(255, 223, 180, 0),
                                    ),
                                  ),
                                  Icon(
                                    Icons.logout,
                                    color: Color.fromARGB(255, 223, 180, 0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
// btn đi đến cửa hàng
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                side: const BorderSide(
                                    width: 1.0,
                                    color:
                                    Color.fromARGB(255, 223, 180, 0)),
                                // padding: EdgeInsets.only(left: 10, right: 10),
                                backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                // Get.to();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Đi đến cửa hàng',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      Color.fromARGB(255, 223, 180, 0),
                                    ),
                                  ),
                                  // Icon(Icons.logout, color: Color.fromARGB(255,223, 180, 0),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
