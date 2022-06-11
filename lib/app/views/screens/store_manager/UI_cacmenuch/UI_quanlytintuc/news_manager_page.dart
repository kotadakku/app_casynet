
import 'package:app_casynet/app/controller/store_manager/news/news_manager_controller.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../store/new_post.dart';
import '../../../store/search_news.dart';

class NewsManagerPage extends StatelessWidget {
  NewsManagerPage({Key? key}) : super(key: key);

  NewsManagerCotroller _newsManagerCotroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'news'.tr,
          // style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions: [
          Container(
            height: 40,
            width: 80,
            margin: new EdgeInsets.all(10.0),

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              child: Text("${'add'.tr} +"),
              onPressed: () {
                Get.toNamed(Routes.STORE_MANAGER_ADD_NEW);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 3.0.h,
            ),
            Container(
              height: 55,
              color: AppColors.backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
              child: TextField(
                cursorColor: AppColors.textGrayColor,
                onTap: () {
                  Get.to(SearchNews());
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusColor: AppColors.yellowColor,
                  contentPadding: EdgeInsets.all(5.0),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'search'.tr,
                  hintStyle: TextStyle(color: AppColors.textGrayBoldColor),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0)),
                ),
              ),
            ),
            ListView(
              shrinkWrap:true,
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.h),
                      child: Row(
                        children: [
                          Container(
                              child: Obx(()=>Checkbox(
                                value: _newsManagerCotroller.isSelectedAll.value,
                                onChanged: (value) {
                                  _newsManagerCotroller.selectAllNew(value!);
                                },
                              ),)
                          ),
                          Spacer(),
                          Obx(()=>_newsManagerCotroller.isSelectedAll.value ?
                          ElevatedButton(onPressed: (){
                            _newsManagerCotroller.deleteAllNews();
                          },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                              ),
                              child: Row(
                                children: [
                                  Text('delete'.tr),
                                  Obx(()=>Text(" ${_newsManagerCotroller.listSelected.length} ${'record'.tr}"),)
                                ],
                              ))
                              : SizedBox()
                          )

                        ],
                      ),
                    ),


                  ],
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Obx(()=>Checkbox(
                              value: _newsManagerCotroller.ckeckInList(index),
                              onChanged: (value) {
                                _newsManagerCotroller.ckeckInList(index) ?
                                _newsManagerCotroller.listSelected.remove(index) :
                                _newsManagerCotroller.listSelected.add(index);
                              },)
                            ),
                          ),
                          ImageNetworkLoading(
                              width: 50,
                              image_url: "https://thecsrjournal.in/wp-content/uploads/2018/10/speed-post.png"
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Thay lốp Maxxis chính hãng miễn phí",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ImageIcon(AssetImage(
                                            "assets/images/Icon/icon_butchi.png"),size: 20,),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text("${'update_at'.tr}:15/09/2021",maxLines: 1,overflow: TextOverflow.ellipsis,),),
                                        ImageIcon(AssetImage("assets/images/Icon/icon_dung2.png"),size: 18,color: Colors.green,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
