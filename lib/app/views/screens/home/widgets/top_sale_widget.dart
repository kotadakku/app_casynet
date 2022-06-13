
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/home/api/top_sale_controller.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/image_network_loading.dart';
import '../../../widgets/loading_overlay.dart';
import '../../../widgets/shimmer/top_sale_shimmer.dart';
import '../../../widgets/shimmer_loading.dart';
import 'items/top_sale_item.dart';


class TopSaleWidget extends StatelessWidget {
  TopSaleWidget({Key? key}) : super(key: key);
  final TopSaleController _saleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child:  (
            Obx(() =>  LoadingOverlay(isLoading: _saleController.isLoadingDB.value,
              shimmer: const PromotionBlurWidget(),
              child: Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _saleController.topSaleList.length,
                    itemBuilder: (context, index){

                      if(_saleController.topSaleList.length ==0){
                        return Text("Không có dữ liệu");
                      }
                      else{
                        return CardItem(image_url: _saleController.topSaleList[index].image, title: _saleController.topSaleList[index].title);
                      }
                    },
                  ),
                  _saleController.error == ''? SizedBox()
                      : Positioned.fill(
                      child: Container(
                        color: AppColors.backgroundColor.withOpacity(0.5),
                        padding: EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Text("${_saleController.error}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  child: Text('retry'.tr),
                                  onPressed: (){
                                    _saleController.getTopSaleAPI();
                                  },
                                ),
                                SizedBox(width: 10,),
                                ElevatedButton(
                                  child: Text('skip'.tr),
                                  onPressed: (){
                                    _saleController.error.value = '';
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  _saleController.isLoadingAPI.value ?
                  Positioned.fill(
                      child: Container(
                          padding: EdgeInsets.only(top: 100),
                          color: AppColors.backgroundColor.withOpacity(0.5),
                          child: Center(
                            child: CircularProgressIndicator(),
                          )
                      )
                  ) : SizedBox()

                ],
              )
            )
            )
          )
      ),
    );
  }
}






