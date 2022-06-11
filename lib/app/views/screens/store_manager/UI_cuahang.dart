import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/Appbar.dart';
import 'widgets/Bottommenu.dart';

class MenuCuahang extends StatelessWidget {
  const MenuCuahang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Appbars(),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.toNamed(Routes.ACCOUNT_BASE);
            },
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.network(
                        "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        width: 100,
                        height: 100,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/images/Icon/icon_xemay.png"),
                              ),
                            ),
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_CONTROL);
                },
                child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_dashboard.png"),
                              color: Colors.amber,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'dashboard'.tr,
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                ),
              ),

              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_INFO);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage("assets/images/Icon/icon_ttcuahang.png"),
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'info_seller'.tr,
                          style: TextStyle(fontSize: 20,

                          ),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_ORDERS);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.dashboard),
                      ),
                      Expanded(
                        child: Text(
                          'order_management'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_PRODUCTS);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage("assets/images/Icon/icon_dvsp.png"),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'services_products'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_GIFTS);
                },
                child:  Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage("assets/images/Icon/icon_quatang.png"),
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'gift_management'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.STORE_MANAGER_NOTIS);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage("assets/images/Icon/icon_thongbao.png"),
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'noti_manage'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  print("error");
                  Get.toNamed(Routes.STORE_MANAGER_NEWS);

                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ImageIcon(
                          AssetImage("assets/images/Icon/icon_tintuc.png"),
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'news'.tr,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                )
              ),
              Container(
                margin: new EdgeInsets.only(top: 20),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: ElevatedButton(
                  child: Text(
                    "Đi đến cửa hàng",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottommenu(),
    );
  }
}
