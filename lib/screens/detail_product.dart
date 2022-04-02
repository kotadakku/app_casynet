import 'package:app_casynet/theme/app_colors.dart';
import 'package:app_casynet/widget/detail_product/tags_product_widget.dart';
import 'package:app_casynet/widget/detail_product/vote_product_widget.dart';
import 'package:flutter/material.dart';
import '../widget/detail_product/chat_product_widget.dart';
import '../widget/detail_product/detail_product_widget.dart';
import '../widget/detail_product/featured_product_widget.dart';
import '../widget/detail_product/image_product_widget.dart';
import '../widget/detail_product/information_product_widget.dart';
import '../widget/detail_product/information_store_widget.dart';
import '../widget/detail_product/revervation_product.dart';
import '../widget/detail_product/top_detail_product_widget.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TopDetailProductWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ImageProductWidget(),
                        InformationProductWidget(),
                        RevervationProductWidget(),
                        InformationStoreWidget(),
                        DetailProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        VoteProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        ChatProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        TagsProductWidget(),
                        Container(
                          height: 10,
                          color: kBackgroundColor,
                        ),
                        FeaturedProductWidget(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kYellowColor),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text("Đặt hàng")],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
