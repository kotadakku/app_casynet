
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../widgets/appbar_cart.dart';
import 'widgets/chat_product_widget.dart';
import 'widgets/detail_product_widget.dart';
import 'widgets/featured_product_widget.dart';
import 'widgets/image_product_widget.dart';
import 'widgets/information_product_widget.dart';
import 'widgets/information_store_widget.dart';
import 'widgets/revervation_product.dart';
import 'widgets/tags_product_widget.dart';
import 'widgets/top_detail_product_widget.dart';
import 'widgets/vote_product_widget.dart';


class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCartWidget(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

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
        )
      )
    );
  }
}
