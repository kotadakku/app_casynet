
import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/widget/detail_store/gift_store_widget.dart';
import 'package:flutter/material.dart';

class NewsStoreWidget extends StatelessWidget {
  const NewsStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GiftStoreWidget(),
          Divider(height: 30, color: kBackgroundColor, thickness: 5,),
          ListView.builder(
            physics: BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.add),
                title: Text("Sơn các dòng xe BMW ở đâu uy tín?"),
                subtitle: Text("Admin - 05/01/2020"),
              )
          )
        ],
      ),
    );
  }
}
