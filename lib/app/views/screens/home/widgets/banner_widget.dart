
import 'package:app_casynet/app/controller/home/banner_page_view_controller.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
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
        child: _fetchBannerController.obx((state) => Stack(
          children: [
            PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.length,
                controller: _bannerController.pageController,
                pageSnapping: true,
                onPageChanged: (index){
                  _bannerController.current_banner.value = index;
                },
                itemBuilder: (context, index){
                  if(state.isNotEmpty)
                    // return ImageNetworkLoading(image_url: state[index].image, fit: BoxFit.fitWidth);
                    return Html(
                      data: state[index].htmlTag,
                      // Styling with CSS (not real CSS)
                      style: {
                        'img': Style(
                            height: ScreenUtil().screenWidth/1125*410,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(0.0),
                        ),
                      },
                    );
                  else return Center(
                    child: CircularProgressIndicator(),
                  );
                }
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                    Obx(()=>Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: indicators(_bannerController.current_banner.value, state.length)
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
        )
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



