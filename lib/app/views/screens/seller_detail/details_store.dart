
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_detail/detail_store_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../widgets/appbar/appbar_cart.dart';
import '../../widgets/image_network_loading.dart';
import '../../widgets/loading_screen.dart';
import '../seller_detail/store_map.dart';
import 'widgets/aq_store_widget.dart';
import 'widgets/intro_store_widget.dart';
import 'widgets/new_store_widget.dart';
import 'widgets/product_store.dart';
import 'widgets/profile_store.dart';
import 'widgets/vote_store_widget.dart';


class DetailsStorePage extends StatelessWidget {
  final DetailStoreController _detailStoreController = Get.find<DetailStoreController>();
  DetailsStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCartWidget(),
      body: Obx(()=> _detailStoreController.isLoading.value ? LoadingScreen():
      DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        child: Column(
                          children: [

                            Container(
                                height: 150,
                                child: ImageNetworkLoading(
                                  image_url: _detailStoreController.store.value.avatar_image.toString(),
                                  fit: BoxFit.fill,
                                )
                            ),
                            ProfileStoreWidget( controller: _detailStoreController,),
                          ],
                        ),

                      )
                    ]))
              ];
            },
            body: Column(
              children: [
                TabBar(
                    isScrollable: true,
                    controller: _detailStoreController.controller,
                    indicatorColor: AppColors.yellowColor,
                    unselectedLabelColor: AppColors.textGrayColor,
                    labelColor: AppColors.yellowColor,
                    onTap: (index) {
                    },
                    tabs: _detailStoreController.listTabs.map((e) =>
                        Tab(
                          child: Text(e,
                            style: TextStyle(),
                          ),
                        )
                    ).toList()
                ),
                Expanded(
                    child: TabBarView(
                      controller: _detailStoreController.controller,
                      children: [
                        IntroStoreWidget(controller: _detailStoreController),
                        ProductStoreWidget(),
                        NewsStoreWidget(),
                        VoteStoreWidget(),
                        AQStoreWidget(),
                      ],
                    )
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {

                                  Get.to(StoreMapPage(), arguments: {
                                    "name": _detailStoreController.store.value.name,
                                    'lat': _detailStoreController.store.value.lat,
                                    'lon' : _detailStoreController.store.value.lon,
                                    "address": _detailStoreController.store.value.address
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    onPrimary: Colors.white,
                                    primary: Colors.white,
                                    side:
                                    BorderSide(width: 1.0, color: AppColors.yellowColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.map,
                                        color: AppColors.yellowColor,
                                        size: AppSize.iconSize,
                                      ),
                                    ),
                                    Text(
                                      "Bản đồ",
                                      style: TextStyle(color: AppColors.yellowColor),
                                    )
                                  ],
                                )),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  _detailStoreController.controller.animateTo(4,
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeInBack
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    onPrimary: Colors.white,
                                    primary: Colors.white,
                                    side:
                                    BorderSide(width: 1.0, color: AppColors.yellowColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )
                                ),
                                child: Text("Hỏi đáp",
                                    style: TextStyle(color: AppColors.yellowColor))),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  _detailStoreController.controller.animateTo(3);
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: AppColors.yellowColor,
                                    side:
                                    BorderSide(width: 1.0, color: AppColors.yellowColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                child: Text("Đánh giá",
                                    style: TextStyle(color: Colors.white))),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
      )
    );

  }
}
