import 'package:app_casynet/app/utlis/int_to_price.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_sizes.dart';
import '../reservation_widget.dart';

class ItemProductWidget extends StatelessWidget {
  final products;
  final int index;

  const ItemProductWidget({
    Key? key, required this.products, required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: (){
          Get.toNamed(
            Routes.PRODUCT_DETAIL,
            arguments: { 'product': products[index] },
          );
          FocusScope.of(context).unfocus();

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxWidth,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Obx(()=>ImageNetworkLoading(
                      image_url: products[index].thumbnail.toString(),
                      fit: BoxFit.fill
                  ),),

                  Obx(()=> products[index].coinPoint != null
                      ? Positioned(
                          right: 5,
                          top: 5,
                          child: ItemAddPoint(color: Colors.red, width: 50, point: products[index].coinPoint
                          )
                        )
                      : SizedBox()

                  ),

                  Obx(()=> products[index].coinPoint != null
                      ? Positioned(
                          top: 5,
                          left: 5,
                          child: ItemSale(color: AppColors.yellowColor, width: 40, sale: products[index].coinPoint
                          )
                        )
                      : SizedBox())
                ],
                // Image.asset("")
              ),
            ),
            SizedBox(height: 10.0.h,),
            Obx(()=>Text(products[index].name.toString(),
              overflow: TextOverflow.ellipsis,
            ),),
            SizedBox(height: 10.0.h,),
            Row(
              children: [
                Obx(()=>
                  Text('${IntToPrice(products[index].price??products[index].officialPrice??0).intToPrice() } đ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(width: 5.w,),
                if(products[index].price != null)
                  Obx(()=>Text(
                    '${IntToPrice(products[index].officialPrice ?? 0).intToPrice()}',
                    style: TextStyle(
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough
                    ),
                  ),)
              ],
            ),
            SizedBox(height: 10.0.h,),
            products[index].seller == null ? Text('Chưa có thông tin') : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:
                Obx(()=>Text( products[index].seller?.name ?? 'Chưa có thông tin',
                  style: TextStyle(
                    fontSize: 12,

                  ),
                  overflow: TextOverflow.ellipsis,
                ),)
                ),

                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.locationArrow, color: AppColors.textGrayBoldColor, size: 15,),
                    SizedBox(width: 3,),
                    Obx(()=>Text("${products[index].seller?.distance ?? 0.0} km",
                      style: TextStyle(
                          fontSize: 12.sp
                      ),
                    ))
                  ],
                ),

              ],
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(4),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.solidThumbsUp, color: AppColors.textGrayBoldColor, size: AppSize.iconSize,),
                      SizedBox(width: 2.0,),
                      Obx(()=>Text('${products[index].likeQty ?? 0}',
                          style: TextStyle(
                              fontSize: 15.sp
                          )
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.comment, color: AppColors.textGrayBoldColor, size: AppSize.iconSize,),
                      SizedBox(width: 2.0,),
                      Obx(()=>Text('${products[index].commentQty ?? 0}',
                          style: TextStyle(
                              fontSize: 15.sp
                          )
                      ),)
                    ],
                  ),
                  Row(
                    children: [

                      Obx(()=>Text('${products[index].rate ?? 0.0}',
                        style: TextStyle(
                            fontSize: 15.sp
                        ),
                      ),),
                      const SizedBox(width: 2.0,),
                      const Icon(Icons.star_outlined, size: 15, color: AppColors.textGrayBoldColor,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ItemAddPoint extends StatelessWidget {
  final Color color;
  final double width;
  final int? point;
  const ItemAddPoint({Key? key, required this.color, required this.width, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Stack(
        children: [
          Stack(
            children: [

              SvgPicture.asset("assets/images/home/sale.svg", height: 20, color: color,),
              Positioned.fill(
                  child: Center(
                    child: Text("+$point điểm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13
                      ),
                    ),
                  )
              ),
            ],
          ),
          Positioned(
            bottom : 0.5,
            left: 4,
            child: SvgPicture.asset("assets/images/home/rect_sale.svg", height: 5, color: color,
            ),
          ),
        ],
      ),
    );
  }
}