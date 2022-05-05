
import 'dart:convert';

import 'package:app_casynet/app/controller/home/fetch_topsales_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../widgets/image_network_loading.dart';
import '../../../widgets/loading_overlay.dart';
import '../../../widgets/shimmer_loading.dart';


class TopSaleWidget extends StatelessWidget {
  const TopSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: GetBuilder<FetchTopSalesController>(
              init: FetchTopSalesController(),
              builder: (controller){
                return LoadingOverlay(
                    isLoading: controller.isLoading,
                    shimmer: PromotionBlurWidget(),
                    child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: controller.listSales.length,
                          itemBuilder: (context, index){
                            if(controller.listSales.length ==0){
                              return Text("Không có dữ liệu");
                            }
                            else{
                              return CardItem(image_url: controller.listSales[index].image, title: controller.listSales[index].title);
                            }
                          },
                      ),
                    )
                );
              }
          )),
    );
  }
}

class CardItem extends StatelessWidget {
  final String image_url;
  final String title;
  const CardItem({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var divide = ScreenUtil().screenWidth>=750 ? 5 : 4;
       return Container(
         height: 80,
         width: ScreenUtil().screenWidth/divide,
         child: Column(
           children: [
             SizedBox(
               height: 50,
               width: 50,
               child: Image.memory(base64.decode(image_url)),
             ),

             SizedBox(height: 10,),
             Text(title),
           ],
         ),
       );
      }
    );
  }
}

class PromotionBlurWidget extends StatelessWidget {
  const PromotionBlurWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
          4, (index) => Container(
        width: ScreenUtil().screenWidth/4,
        height: 80,
        child: Column(
          children: [
            ShimmerLoading(isLoading: true,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),),
            SizedBox(height: 10,),
            ShimmerLoading(isLoading: true, child: Container(
              height: 10,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),)

          ],
        ),
      )
      ),

    );
  }
}


