import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../theme/app_colors.dart';
class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultChoiceIndex = [0].obs;
    List<String> _choicesList = ['Tên bài viết', 'Người đăng', 'Ngày đăng'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ],
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: const Text(
            "Tìm kiếm bài viết",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                    margin: EdgeInsets.only(right: 10.0.w),
                    child: Text("Tìm theo",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Divider(
            height: 1.h,
          ),
          Container(
            height: 50.0.h,
            margin: EdgeInsets.only(left: 10.0.w,right: 10.0.w, bottom: 5.0.h),
            child: Wrap(
                spacing: 8,
                children: List.generate(_choicesList.length, (index) {
                  return Obx(() => ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),

                    label: Text(
                      _choicesList[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.black, fontSize: 14),
                    ),
                    backgroundColor: Colors.white,
                    selected: defaultChoiceIndex.contains(index),
                    selectedColor: Color.fromARGB(255, 223, 180, 0),
                    onSelected: (value) {
                      defaultChoiceIndex.contains(index) ? defaultChoiceIndex.remove(index):defaultChoiceIndex.add(index);
                    },
                    // backgroundColor: color,
                    elevation: 1,
                    padding: EdgeInsets.all(5.0),
                  ));
                })),
          ),


          Divider(
            height: 1.h,
          ),


          Container(
            height: 10.h,
            color: const Color.fromARGB(255, 241, 243, 253),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                    margin: EdgeInsets.only(right: 10.0.w),
                    child: Text("Thông tin cần tìm",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Divider(
            height: 1.h,
          ),
          Container(
              height: 150.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nhập thông tin cần tìm",
                  hintStyle: TextStyle(color: kTextColor),
                  counterText: "",
                  border: InputBorder.none,

                ),
                maxLength: 400,
                maxLines: null,
                // controller: tensanpham,
                onChanged: (value) {

                },
              )),

          Container(
            height: 10.h,
            color: const Color.fromARGB(255, 241, 243, 253),
          ),
          Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 80, right: 80),
                backgroundColor: Color.fromARGB(255, 223, 180, 0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              // sự kiện chuyển màn
              onPressed: () {},
              child: const Text(
                'Tìm kiếm bài viết',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
