
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/home_controller.dart';

class BannerHomeWidget extends StatelessWidget {
  BannerHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> banner_urls = [
      "assets/home/banner1.png",
      "assets/home/banner1.png"
    ];
    return SizedBox(
        height: MediaQuery.of(context).size.width/1125*410,
        child: Stack(
          children: [
            PageView.builder(
                itemCount: banner_urls.length,
                onPageChanged: (index){
                  Get.find<BannerController>().current.value = index;
                },
                itemBuilder: (context, index){
                  return Stack(
                    children: [
                      Image.asset(banner_urls[index]),
                    ],
                  );
                }
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: indicators(Get.find<BannerController>().current, banner_urls.length)
                  )
                )
              )
            ),
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



