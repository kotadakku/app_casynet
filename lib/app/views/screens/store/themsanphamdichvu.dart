
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../controller/CuaHangCuaToi/hinh_thuc_selection_controller.dart';
import '../../../controller/store/imagepicker_controller.dart';
import '../theme/app_colors.dart';
import 'chon_danh_muc.dart';

class ThemSanPhamDichVu extends StatelessWidget {
  HinhThucSelectionController htSelecttion =
      Get.put(HinhThucSelectionController());
  ImagePickerController imgController = Get.put(ImagePickerController());

  ThemSanPhamDichVu({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    var checkHienThiSanPham = false.obs;
    var checkSanPhamNoiBat = false.obs;
    var countTenSP = 0.obs;
    var countMoTaSP = 0.obs;
    final ChonDanhMucController controller = Get.put(ChonDanhMucController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,

          ),
        ),
        title: const Text(
          "Thêm sản phẩm/ dịch vụ",
        ),
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
                                  overflow: Overflow.visible,
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
                      Divider(
                        height: 5.h,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Hiển thị sản phẩm"),
                            /*Switch(value: true, onChanged: (value){}),*/
                            Obx(() => CupertinoSwitch(
                                value: checkHienThiSanPham.value,
                                onChanged: (value) {
                                  checkHienThiSanPham.value = value;
                                  print(checkHienThiSanPham);
                                }))
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Sản phẩm nổi bật"),
                            /*Switch(value: true, onChanged: (value){}),*/
                            Obx(() => CupertinoSwitch(
                                value: checkSanPhamNoiBat.value,
                                onChanged: (value) {
                                  checkSanPhamNoiBat.value = value;
                                  print(checkSanPhamNoiBat);
                                }))
                          ],
                        ),
                      ),
                      Container(
                        height: 10.h,
                        color: const Color.fromARGB(255, 241, 243, 253),
                      ),
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text(
                          "Hình thức",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width:
                            MediaQuery.of(context).size.width / 2 - 10.w,
                            height: 50.h,
                            margin: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Obx(() => Radio(
                                  groupValue:
                                  htSelecttion.selectedItem.value,
                                  onChanged: (value) {
                                    htSelecttion.onChangeItem(value);
                                  },
                                  value: 'datMua',
                                )),
                                const Text("Đặt mua"),
                              ],
                            ),
                          ),
                          Container(
                            width:
                            MediaQuery.of(context).size.width / 2 - 10.w,
                            height: 50.h,
                            margin: EdgeInsets.only(right: 10.w),
                            child: Row(
                              children: [
                                Obx(() => Radio(
                                  groupValue:
                                  htSelecttion.selectedItem.value,
                                  onChanged: (value) {
                                    htSelecttion.onChangeItem(value);
                                  },
                                  value: 'datCho',
                                )),
                                const Text("Đặt chỗ"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tên sản phẩm",
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
                                hintText: "Nhập tên sản phẩm",
                                hintStyle: TextStyle(color: kTextColor),
                                counterText: "",
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.edit_outlined,color: kTextColor,)
                            ),
                            maxLength: 120,
                            maxLines: 2,
                            // controller: tensanpham,
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
                              "Mô tả sản phẩm",
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
                      Container(
                          height: 150.h,
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Nhập mô tả sản phẩm",
                              hintStyle: TextStyle(color: kTextColor),
                              counterText: "",
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.edit_outlined, color: kTextColor,),
                            ),
                            maxLength: 400,
                            maxLines: null,
                            // controller: tensanpham,
                            onChanged: (value) {
                              countMoTaSP.value = value.length;
                            },
                          )),
                      Container(
                        height: 10.h,
                        color: const Color.fromARGB(255, 241, 243, 253),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("Mã sản phẩm",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập mã sản phẩm',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          margin:
                          EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          height: 50.0,
                          child: InkWell(
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("Giá",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 127, 141, 171)))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text("Thiết lập giá",style: TextStyle(color: kTextColor),),
                                        Icon(Icons.navigate_next,color: kTextColor,),
                                      ],
                                    ))
                              ],
                            ),
                          )),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("Số lượng",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập số lượng',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          margin:
                          EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          height: 50.0,
                          child: InkWell(
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("Tình trạng kho hàng",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 127, 141, 171)))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text("Còn hàng"),
                                        Icon(Icons.navigate_next),
                                      ],
                                    ))
                              ],
                            ),
                          )),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          margin:
                          EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          height: 50.0,
                          child: InkWell(
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("Hiển thị",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 127, 141, 171)))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text("Danh mục, tìm kiếm"),
                                        Icon(Icons.navigate_next),
                                      ],
                                    ))
                              ],
                            ),
                          )),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          margin:
                          EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          height: 50.0,
                          child: InkWell(
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            onTap: () {
                              Get.to(const ChonDanhMuc());
                            },
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("Danh mục",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 127, 141, 171)))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(controller.chonDanhmuc.toString(), style: TextStyle(color: kTextColor),),
                                        const Icon(Icons.navigate_next),
                                      ],
                                    ))
                              ],
                            ),
                          )),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                          margin:
                          EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                          height: 50.0,
                          child: InkWell(
                            splashColor: const Color.fromARGB(255, 188, 195, 216),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("Thương hiệu",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 127, 141, 171)))
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text("Chọn thương hiệu",style: TextStyle(color: kTextColor),),
                                        Icon(Icons.navigate_next),
                                      ],
                                    ))
                              ],
                            ),
                          )),
                      Container(
                        height: 10.h,
                        color: const Color.fromARGB(255, 241, 243, 253),
                      ),
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: const Text(
                          "Tối ưu công cụ tìm kiếm",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("URL key",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập URL key',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("Tiêu đề meta",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập tiêu đề meta',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("Từ khóa meta",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập từ khóa meta',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text("Mô tả meta",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 127, 141, 171)))),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // suffixIcon: Icon(Icons.navigate_next),

                                  hintText: 'Nhập mô tả meta',
                                  hintStyle: TextStyle(color: kTextColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.h,
                      ),
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
                                    "Thêm hình ảnh/video sản phẩm",
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
                          // quay video
                          Expanded(
                              flex: 1,
                              // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    imgController.getVideo(ImageSource.camera);
                                  },
                                  // splashColor: Colors.black26,
                                  splashColor:
                                      const Color.fromARGB(255, 188, 195, 216),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Quay video",
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
                          const Divider(
                            height: 2.0,
                          ),
                          Expanded(
                              flex: 1,
                              // padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5.0,right: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    imgController.getVideo(ImageSource.gallery);
                                  },
                                  // splashColor: Colors.black26,
                                  splashColor:
                                      const Color.fromARGB(255, 188, 195, 216),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Thư viện video",
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
class ChonDanhMucController extends GetxController{
  var chonDanhmuc = "Lựa chọn".obs;


}

