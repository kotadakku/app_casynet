
import 'package:app_casynet/app/controller/home/banner_page_view_controller.dart';
import 'package:app_casynet/app/views/theme/app_colors.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/home/api/banner_controller.dart';

class BannerHomeWidget extends StatelessWidget {
  BannerHomeWidget({Key? key}) : super(key: key);
  FetchBannerController _fetchBannerController = Get.find();
  BannerController _bannerController = Get.find();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: ScreenUtil().screenWidth/1125*410,
        child: Obx(()=>
            LoadingOverlay(
              isLoading: _fetchBannerController.isLoadingDB.value,
              child: Stack(
                children: [
                  Obx(()=>PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _fetchBannerController.bannerSliderList.length,
                      controller: _bannerController.pageController,
                      pageSnapping: true,
                      onPageChanged: (index){
                        _bannerController.current_banner.value = index;
                      },
                      itemBuilder: (context, index){
                        return Html(
                          data: _fetchBannerController.bannerSliderList[index].htmlTag,
                          style: {
                            'img': Style(
                              height: ScreenUtil().screenWidth/1125*410,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(0.0),
                              margin: EdgeInsets.all(0.0),

                            ),
                          },
                        );
                      }
                  ),),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child:
                          Obx(()=>Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: indicators(_bannerController.current_banner.value,
                                  _fetchBannerController.bannerSliderList.length)
                          ))
                      )
                  ),
                  GestureDetector(
                    onTap: () {},
                    onPanEnd: (details) {
                      _bannerController.swippingPageView(details);
                    },
                  )
                ],
              ),
              // child:  _fetchBannerController.error == ""
              //   ? Stack(
              //     children: [
              //       PageView.builder(
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: _fetchBannerController.bannerSliderList.length,
              //           controller: _bannerController.pageController,
              //           pageSnapping: true,
              //           onPageChanged: (index){
              //             _bannerController.current_banner.value = index;
              //           },
              //           itemBuilder: (context, index){
              //             return Container(
              //               color: AppColors.backgroundColor,
              //               child: Html(
              //                 data: _fetchBannerController.bannerSliderList[index].htmlTag,
              //                 style: {
              //                   'img': Style(
              //                       height: ScreenUtil().screenWidth/1125*410,
              //                       alignment: Alignment.center,
              //                       padding: EdgeInsets.all(0.0),
              //                       margin: EdgeInsets.all(0.0),
              //
              //                   ),
              //                 },
              //               ),
              //             );
              //           }
              //       ),
              //       Positioned.fill(
              //           child: Align(
              //               alignment: Alignment.bottomCenter,
              //               child:
              //               Obx(()=>Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   mainAxisSize: MainAxisSize.max,
              //                   children: indicators(_bannerController.current_banner.value,
              //                       _fetchBannerController.bannerSliderList.length)
              //               ))
              //           )
              //       ),
              //       GestureDetector(
              //         onTap: () {},
              //         onPanEnd: (details) {
              //           _bannerController.swippingPageView(details);
              //         },
              //       )
              //     ],
              //   )
              //   : Column(
              //     children: [
              //       Text("${_fetchBannerController.error.value}"),
              //       ElevatedButton(
              //         child: Text('Thử lại'),
              //         onPressed: (){
              //           _fetchBannerController.getBannerAPI();
              //         },
              //       )
              //     ],
              //   ),
              ),
            )
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



