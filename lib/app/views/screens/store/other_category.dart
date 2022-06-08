import 'package:app_casynet/app/controller/home/api/category_controller.dart';
import 'package:app_casynet/app/controller/store/choose_category_controller.dart';
import 'package:app_casynet/app/controller/store/new_created_store_controller.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtherCategory extends StatelessWidget {
  OtherCategory({
    Key? key,
  }) : super(key: key);

  // final List<Category> itemCategory;
  CategoryController dataCtr = Get.find();
  NewCreatedStoreController newCreatedStoreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () => _onWillPopOtherCategory(context),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          title: const Text("Chọn danh mục nghề khác"),
          actions: [

          ],
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
                  return Obx(
                    () => CheckboxListTile(
                      activeColor: const Color.fromARGB(255, 223, 180, 0),
                      title: Row(
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
                      value: newCreatedStoreController.listOtherCategory.value
                          .contains(dataCtr.categoriesList[index].id),
                      onChanged: (bool? value) {
                        //
                        if (newCreatedStoreController.listOtherCategory.value
                            .contains(dataCtr.categoriesList[index].id)) {
                          newCreatedStoreController.listOtherCategory
                              .remove(dataCtr.categoriesList[index].id);
                        } else
                          newCreatedStoreController.listOtherCategory
                              .add(dataCtr.categoriesList[index].id);
                      },
                      controlAffinity: ListTileControlAffinity.leading,// checkbox hiện bên trái
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

  Future<bool> _onWillPopOtherCategory(BuildContext context) async{
    late bool? exitResult;


    return true;
  }
}



