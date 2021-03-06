
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
import 'management_revenue.dart';
import 'management_order.dart';
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
        title: Text('my_seller'.tr),
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
                    "assets/images/bottom_navi_icon/noti.svg",
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
                    AssetImage("assets/images/store/ic_question_circle.png"),
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
                              "assets/images/store/img_74.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            // color: Colors.black26,
                            alignment: Alignment.center,
                            height: 50,
                            child: const Text(
                              "C??ng ty TNHH Th??? B???o",
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
                    //         "S???a c???a h??ng",
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
                                  "assets/images/store/img_mask_group_14.png"),
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
// qu???n l?? doanh thu
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
                          const Text("Qu???n l?? doanh thu",
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
// Qu???n l?? ????n h??ng
              InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                // splashColor: Colors.blue,
                onTap: () {
                  Get.to(OrderManagement());
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
                          Text('order_management'.tr,
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
// Qu???n l?? s???n ph???m
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
                          const Text("Qu???n l?? s???n ph???m",
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
//Danh s??ch s???n ph???m/D???ch v???
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
                              Text("Danh s??ch s???n ph???m/D???ch v???",
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
//Th??m s???n ph???m d???ch v???
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
                              Text("Th??m s???n ph???m d???ch v???",
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
// K??nh marketing
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
                        const Text("K??nh marketing",
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
//Qu?? t???ng c???a h??ng
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
                            children: [
                              Text('gift_seller'.tr,
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
//Th??ng b??o t???i kh??ch h??ng
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
                              Text("Th??ng b??o t???i kh??ch h??ng",
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
//Qu???n l?? Casycoin
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
                              Text("Qu???n l?? Casycoin",
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
//Qu???ng c??o v???i Casynet
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
                              Text("Qu???ng c??o v???i Casynet",
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
// Qu???n l?? c???a h??ng
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
                        const Text("Qu???n l?? c???a h??ng",
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
//????nh gi??
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
                            children: [
                              Text('rate'.tr,
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

//H???i ????p
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
                            children: [
                              Text('qa'.tr,
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
//Tin T???c
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
                            children: [
                              Text('news'.tr,
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
//D??? li???u
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
                              Text("D??? li???u",
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
// C??i ?????t c???a h??ng
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
                        const Text("C??i ?????t c???a h??ng",
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
//Thi???t l???p th??ng tin
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
                              Text("Thi???t l???p th??ng tin",
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
//C??i ?????t th??ng b??o
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
                              Text("C??i ?????t th??ng b??o",
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
// btn ????ng xu???t
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
                                children: [
                                  Text(
                                    'signout'.tr,
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
// btn ??i ?????n c???a h??ng
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
                                    '??i ?????n c???a h??ng',
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
