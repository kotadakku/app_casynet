

import 'package:app_casynet/containts/size.dart';
import 'package:app_casynet/controller/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../containts/colors.dart';

class ImageProductWidget extends StatelessWidget {
  ImageProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: 0);
    List<String> banner_urls = [
      "assets/detail_product/product_1.png",
      "assets/home/banner1.png"
    ];
    return Container(
        height: 400,
        child:
        Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: banner_urls.length,
                onPageChanged: (value){
                  Get.find<BannerProductController>().current.value = value;
                },
                itemBuilder: (context, index){

                  return Image.asset(banner_urls[index], fit: BoxFit.fitHeight);
                }
            ),
            // Button yêu thích
            Positioned(
                left: 5,
                bottom: 15,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border, color: Colors.red, size: sizeStar.width,),
                            SizedBox(width: 5,),
                            Text("Yêu thích",
                              style: TextStyle(

                                  color: Colors.red
                              ),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                        ), onPressed: () {  },
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share, color: kTextColor, size: sizeStar.width,),
                            SizedBox(width: 5,),
                            Text("Chia sẻ",
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                        ), onPressed: () {  },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Obx(()=> Row(
                        children: indicators(Get.find<BannerProductController>().current.value, banner_urls.length)
                    ))
                  ],
                )
            ),
            Positioned(
                bottom: 15,
                right: 10,
                child: Container(
                    height: 30,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),

                    child: Obx(()=> Text("${Get.find<BannerProductController>().current.value+1}/${banner_urls.length}"))
                )
            )
          ],
        )
    );
  }
  List<Widget> indicators(curPage, numPage){
    return List.generate(numPage, (index) => Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: curPage == index ? Color(0xffD4AD0B): Colors.white,
          shape: BoxShape.circle
      ),
    ));
  }
}