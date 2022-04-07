
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/home_controller.dart';

class BannerHomeWidget extends StatelessWidget {
  BannerHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.width/1125*410,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller){
            return Stack(
              children: [

                PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.listBanners.length,
                    controller: controller.pageController,
                    pageSnapping: true,
                    onPageChanged: (index){
                      controller.current_banner.value = index;
                    },
                    itemBuilder: (context, index){
                      if(controller.listBanners.isNotEmpty)
                        return Image.memory(base64.decode(controller.listBanners[index].image), fit: BoxFit.fitWidth);
                      else return CircularProgressIndicator();
                    }
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child:
                          Obx(()=>Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: indicators(controller.current_banner.value, controller.listBanners.length)
                          ))
                    )
                ),
                GestureDetector(
                  onTap: () {},
                  onPanEnd: (details) {
                    controller.swippingPageView(details);

                  },
                )
              ],
            );
        })
    );
  }
  List<Widget> indicators(curPage, numPage){
    return List.generate(numPage, (index) =>
      Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: curPage == index ? Color(0xffD4AD0B): Colors.white,
          shape: BoxShape.circle
        ),
      )
    );
  }
}



