
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/home/api/top_sale_controller.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../widgets/image_network_loading.dart';
import '../../../widgets/loading_overlay.dart';
import '../../../widgets/shimmer/top_sale_shimmer.dart';
import '../../../widgets/shimmer_loading.dart';
import 'items/top_sale_item.dart';


class TopSaleWidget extends StatelessWidget {
  TopSaleWidget({Key? key}) : super(key: key);
  TopSaleController _saleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: _saleController.obx((state) => ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: state.length,
            itemBuilder: (context, index){
              if(state.length ==0){
                return Text("Không có dữ liệu");
              }
              else{
                return CardItem(image_url: state[index].image, title: state[index].title);
              }
            },
          ),
            onLoading: PromotionBlurWidget(),

          ) ),
    );
  }
}






