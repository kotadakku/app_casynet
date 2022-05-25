import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../data/model/product.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_sizes.dart';
import '../reservation_widget.dart';

class ItemProductWidget extends StatelessWidget {
  Product product;

  ItemProductWidget({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double grid = .5;
      if(constraints.maxWidth > 500){
        grid = .333;
      }
      return GestureDetector(
        onTap: (){
          Get.toNamed(
            Routes.PRODUCT_DETAIL,
            arguments: { 'product': product },
          );
          FocusScope.of(context).unfocus();

        },
        child: Container(
          width: grid.sw -5.0.w*(1/grid + 1)*grid,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: grid.sw -5.0.w*(1/grid + 1)*grid,
                width: grid.sw -5.0.w*(1/grid + 1)*grid,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(product.thumbnail.toString(),
                        fit: BoxFit.fill),
                    if(product.coinPoint != null) Positioned(
                        right: 5,
                        top: 5,
                        child: ItemAddPoint(color: Colors.red, width: 50, point: product.coinPoint)
                    ),
                    if(product.coinPoint != null) Positioned(
                        top: 5,
                        left: 5,
                        child: ItemSale(color: kYellowColor, width: 40, sale: product.coinPoint)
                    )
                  ],
                  // Image.asset("")
                ),
              ),
              SizedBox(height: 10.0.h,),
              Text(product.name.toString(),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0.h,),
              Row(
                children: [
                  Text(
                    '${(product.price == null && product.officialPrice == null) ?  "Liên hệ" : product.price??product.officialPrice}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Text(
                    product.price == null ? "" : product.price.toString(),
                    style: TextStyle(
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h,),
              product.store == null ? Text('Chưa có thông tin') : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text( product.store?.name ==null ? 'Chưa có thông tin' : product.store!.name.toString(),
                    style: TextStyle(
                      fontSize: 12,

                    ),
                    overflow: TextOverflow.ellipsis,
                  ),),

                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.locationArrow, color: kTextColor_gray, size: 15,),
                      SizedBox(width: 3,),
                      Text("${ product.store?.distance == null ? '0.0' : product.store?.distance} km",
                        style: TextStyle(
                            fontSize: 12.sp
                        ),
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(4),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.solidThumbsUp, color: kTextColor_gray, size: IconSize.iconSize,),
                        SizedBox(width: 2.0,),
                        Text('${product.likeQty ?? 0}',
                            style: TextStyle(
                                fontSize: 15.sp
                            )
                        )
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.comment, color: kTextColor_gray, size: IconSize.iconSize,),
                        SizedBox(width: 2.0,),
                        Text('${product.commentQty ?? 0}',
                            style: TextStyle(
                                fontSize: 15.sp
                            )
                        ),
                      ],
                    ),
                    Row(
                      children: [

                        Text('${product.rate ?? 0.0}',
                          style: TextStyle(
                              fontSize: 15.sp
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        Icon(Icons.star_outlined, size: 15, color: kTextColor_gray,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
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

              SvgPicture.asset("assets/home/sale.svg", height: 20, color: color,),
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
            child: SvgPicture.asset("assets/home/rect_sale.svg", height: 5, color: color,
            ),
          ),


        ],
      ),
    );
  }
}