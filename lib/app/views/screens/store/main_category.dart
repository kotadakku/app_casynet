import 'package:app_casynet/app/controller/store/other_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/home/api/category_controller.dart';
import '../../widgets/image_network_loading.dart';

class MainCategory extends StatelessWidget {
  MainCategory({Key? key}) : super(key: key);
  CategoryController dataCtr = Get.find();
  OtherCategoryController chooseController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          title: const Text("Chọn danh mục chính"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 4.0,
                    thickness: 1.0,
                  );
                },
                itemCount: dataCtr.categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return  InkWell(
                    onTap: (){
                      chooseController.chooseMainCategory.value = dataCtr.categoriesList[index].name.toString();
                      print("danh mục chính" + dataCtr.categoriesList[index].name.toString());
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.w, right: 10.h),
                            height: 50.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(dataCtr.categoriesList[index].name ??
                                    "Không có thông tin"),
                                Stack(
                                  children: [
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      color: Color.fromARGB(255, 223, 180, 0),
                                    ),
                                    Positioned(
                                        left: 12.w,
                                        top: 12.h,
                                        child: ImageNetworkLoading(
                                          image_url: dataCtr
                                              .categoriesList[index].imageUrl
                                              .toString(),
                                          width: 15.w,
                                          height: 15.h,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
