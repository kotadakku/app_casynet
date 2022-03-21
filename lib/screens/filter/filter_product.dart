import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:app_casynet/widget/filter/distint_product_widget.dart';
import 'package:app_casynet/widget/filter/origin_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../containts/colors.dart';
import '../../widget/filter/attribute_product_widget.dart';
import '../../widget/filter/bottom_button.dart';
import '../../widget/filter/price_product_widget.dart';

class FilterProductPage extends StatelessWidget {
  const FilterProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Thanh tìm kiếm
              const TopAccountWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: const [
                    Icon(Icons.filter_alt),
                    SizedBox(width: 10,),
                    Text("Lọc sản phẩm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //Quận huyện
              DistintProductWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                height: 10,
              ),
              //Thuộc tính
              AttributeProductWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                height: 10,
              ),
              //Theo giá
              PriceProductWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                height: 10,
              ),
              // Xuất xư
              OriginProductWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                height: 10,
              ),
              //Bottom Button
              BottomButtonWidget(),
            ],
          ),
        )
      ),
    );
  }
}
