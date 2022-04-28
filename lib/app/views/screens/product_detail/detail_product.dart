
import 'package:app_casynet/app/views/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'widgets/chat_product_widget.dart';
import 'widgets/detail_product_widget.dart';
import 'widgets/featured_product_widget.dart';
import 'widgets/image_product_widget.dart';
import 'widgets/information_product_widget.dart';
import 'widgets/information_store_widget.dart';
import 'widgets/revervation_product.dart';
import 'widgets/tags_product_widget.dart';
import 'widgets/top_detail_product_widget.dart';
import 'widgets/vote_product_widget.dart';


class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 40,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          elevation: 10,
          leading: Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              "assets/home/icon_top_home.svg",
              width: 20,
            )
          ),
          title: TopDetailProductWidget(),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.toNamed(Routes.MESSAGES);
              },
              child: Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                    "assets/product_detail/message.svg"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.HOME);
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(2.0),
                child:Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset("assets/product_detail/cart.svg", width: 25,),
                    ),
                    Positioned(
                      right: -1,
                      top: 2,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        child: Text("11",
                          style: TextStyle(
                            fontSize: 10,
                              color: Colors.white
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                                color: Colors.white
                            )
                        ),
                      )
                    )
                  ],
                )
              ),
            ),
            PopupMenuButton(
                elevation: 20,
                enabled: true,
                offset: Offset(30, 30),
                child: Icon(
                  Icons.more_horiz,
                  color: kTextColor,
                ),
                onSelected: (value) {
                  switch(value){
                    case 'home': Get.toNamed(Routes.HOME); break;
                    case 'product': Get.toNamed(Routes.PRODUCTS_SEEN); break;
                    case 'account': Get.toNamed(Routes.HOME); break;
                    case 'help': Get.toNamed(Routes.HOME);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.home_outlined,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15,
                              right: 10
                          ),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Trang chủ",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "home",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.production_quantity_limits,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15, right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sản phẩm đã xem",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "product",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.account_circle_outlined,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15,
                              right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tài khoản",
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "account",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.help_outline,
                            color: kTextColor,
                          ),
                          padding: EdgeInsets.only(
                              bottom: 15, right: 10),
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trợ giúp",
                                  style: TextStyle(color: kTextColor),
                                ),
                                Divider(
                                  color: kTextColor,
                                  height: 20,
                                  thickness: 1,
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    value: "help",
                  ),
                ]
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    ImageProductWidget(),
                    InformationProductWidget(),
                    RevervationProductWidget(),
                    InformationStoreWidget(),
                    DetailProductWidget(),
                    Container(
                      height: 10,
                      color: kBackgroundColor,
                    ),
                    VoteProductWidget(),
                    Container(
                      height: 10,
                      color: kBackgroundColor,
                    ),
                    ChatProductWidget(),
                    Container(
                      height: 10,
                      color: kBackgroundColor,
                    ),
                    TagsProductWidget(),
                    Container(
                      height: 10,
                      color: kBackgroundColor,
                    ),
                    FeaturedProductWidget(),
                  ],
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kYellowColor),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.add), Text("Đặt hàng")],
                  )),
            ),
          ],
        )
      )
    );
  }
}
