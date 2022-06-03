
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../controller/CuaHangCuaToi/hinh_thuc_selection_controller.dart';
import '../../../controller/store/imagepicker_controller.dart';
import '../../theme/app_colors.dart';

class NewPost extends StatelessWidget {
  HinhThucSelectionController htSelecttion =
  Get.put(HinhThucSelectionController());
  ImagePickerController imgController = Get.put(ImagePickerController());



  @override
  Widget build(BuildContext context) {
    var countTenSP = 0.obs;
    var countMoTaSP = 0.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Thêm bài viết",),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                ),
                onPressed: () {},
                child: const Text(
                  "Lưu",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(
              height: 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                      () => ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          color: const Color.fromARGB(255, 241, 243, 253),
                          child: Wrap(
                            children: [
                              for (int i = 0;
                              i < imgController.imageAndVideoPicker.length;
                              i++)
                                Stack(
                                  clipBehavior: Clip.none,
                                  // overflow: Overflow.visible,
                                  children: [
                                    Container(
                                        width: 110.w,
                                        height: 90.h,
                                        margin: EdgeInsets.only(
                                            bottom: 5.h, left: 5.w, top: 5.h),
                                        color: Colors.red,
                                        child: imgController.imageAndVideoPicker[i].path.toString().endsWith(".jpg")? Image.file(
                                          imgController.imageAndVideoPicker[i],
                                          // width: 100,
                                          fit: BoxFit.cover,
                                        ): VideoPlayer(VideoPlayerController.file(imgController.imageAndVideoPicker[i],))
                                    ),
                                    Positioned(
                                      width: 30.w,
                                      height: 30.h,
                                      top: 5.h,
                                      right: 0.w,
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromARGB(
                                              255, 241, 243, 253),
                                          // Button color
                                          child: InkWell(
                                            onTap: () {
                                              imgController.imageAndVideoPicker.removeAt(i);
                                            },
                                            child: const SizedBox(
                                                child: Icon(
                                                  Icons.close,
                                                  size: 10,
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                width: 110,
                                height: 90,
                                child: OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.amber,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: const Text("Thêm ảnh/ video",
                                      maxLines: 2,
                                      textAlign: TextAlign.center),
                                  onPressed: () {
                                    _tripEditModalBottomSheet(context);
                                    /*x.value = x.value + " ";
                                      pickImage();
                                      print(imageAndVideoPicker.length);*/
                                  },
                                ),
                              ),
                              // Text(x.toString()),
                            ],
                          )),
                      Container(
                        height: 10.h,
                        color: const Color.fromARGB(255, 241, 243, 253),
                      ),
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tiêu đề bài viết",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Obx(() => Text(countTenSP.toString() + "/120")),
                            /*Switch(value: true, onChanged: (value){}),*/
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          height: 50.h,
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Nhập tiêu đề bài viết",
                              hintStyle: TextStyle(color: AppColors.textGrayColor),
                              counterText: "",
                              border: InputBorder.none,

                            ),
                            maxLength: 120,
                            maxLines: 2,
                            // controller: name,
                            onChanged: (value) {
                              countTenSP.value = value.length;
                            },
                          )),
                      Container(
                        height: 10.h,
                        color: const Color.fromARGB(255, 241, 243, 253),
                      ),

                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Nội dung bài viết",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Obx(() => Text(countMoTaSP.toString() + "/400")),
                            /*Switch(value: true, onChanged: (value){}),*/
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Nhập nội dung bài viết",
                              hintStyle: TextStyle(color: AppColors.textGrayColor),
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            maxLength: 400,
                            maxLines: null,
                            // controller: name,
                            onChanged: (value) {
                              countMoTaSP.value = value.length;
                            },
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _tripEditModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .30.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin:
                      EdgeInsets.only(left: 5.0.w, bottom: 5.0.h, right: 5.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // tiêu để showModalBottomSheet
                          Expanded(
                              flex: 1,
                              // padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Thêm ảnh bài viết",
                                    style: TextStyle(
                                        color:
                                        Color.fromARGB(255, 188, 195, 216),
                                        fontSize: 15),
                                  ),
                                ],
                              )),
                          const Divider(
                            height: 2.0,
                          ),
                          // chụp ảnh
                          Expanded(
                              flex: 1,
                              // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    imgController.getImageCamera(ImageSource.camera);
                                  },
                                  // splashColor: Colors.black26,
                                  splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Chụp ảnh",
                                        style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 0, 85, 170),
                                            fontSize: 15),
                                      )
                                    ],
                                  ))),
                          const Divider(
                            height: 2.0,
                          ),
                          //  thư viện ảnh
                          Expanded(
                              flex: 1,
                              // padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5.0,right: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    // imgController.getImage(ImageSource.gallery);

                                    imgController.getImage(ImageSource.gallery);
                                    print(imgController.imageAndVideoPicker.length);

                                  },
                                  // splashColor: Colors.black26,
                                  splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Thư viện ảnh",
                                        style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 0, 85, 170),
                                            fontSize: 15),
                                      )
                                    ],
                                  ))),

                        ],
                      ),
                    ),
                    const Divider(
                      height: 5.0,
                    ),
                    Container(
                      // alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin:
                        const EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5.0, right: 5.0),
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            // splashColor: Colors.black26,
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Hủy",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 85, 170),
                                      fontSize: 15),
                                )
                              ],
                            ))),
                  ],
                ),
              ],
            ),
          );
        });
  }
}


