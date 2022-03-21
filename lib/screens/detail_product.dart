
import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/widget/detail_product/vote_product_widget.dart';
import 'package:flutter/material.dart';

import '../widget/detail_product/chat_product_widget.dart';
import '../widget/detail_product/detail_product_widget.dart';
import '../widget/detail_product/imge_product_widget.dart';
import '../widget/detail_product/information_product_widget.dart';
import '../widget/detail_product/information_store_widget.dart';
import '../widget/detail_product/top_detail_product_widget.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopDetailProductWidget(),
              ImageProductWidget(),
              InformationProductWidget(),
              InformationStoreWidget(),
              DetailProductWidget(),
              Container(height: 20, color: kBackgroundColor,),
              VoteProductWidget(),
              ChatProductWidget(),
            ],
          )
        ),
      ),
    );
  }

}
