import 'dart:convert';
import 'dart:io';

import 'package:app_casynet/app/controller/store_manager/product/add_product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../../../data/model/category.dart';
import '../../../../../data/model/origin.dart';
import '../../../../../routes/app_pages.dart';
import '../../CheckInternet.dart';
import 'UI_Chondanhmuc.dart';
import 'UI_Chonloaisanpham.dart';
import 'danhmuc.dart';

class Themspdv extends StatefulWidget {
  const Themspdv({Key? key}) : super(key: key);

  @override
  State<Themspdv> createState() => _ThemspdvState();
}

final getdms = Get.put(getdanhmuc());

class _ThemspdvState extends State<Themspdv> {
  final AddProductController _addProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Thêm Dịch vụ/ Sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: themspdvs(context),
    );
  }

  Widget themspdvs(BuildContext context) {

    List<dynamic> imagepicker = [].obs;
    var x = "".obs;
    File imagepk;
    Future pickvideo() async {
      final XFile? video = await ImagePicker().pickVideo(source: ImageSource.camera);
      if (video != null) {
        imagepk = File(video.path);
        imagepicker.add(imagepk);
      }
      return imagepicker;
    }
    Future hienvideo() async{
      if(imagepicker.length>0){
        for(int i=0;i<imagepicker.length;i++){
          if(imagepicker[i].toString().contains(".mp4")){
            _addProductController.controller.value = VideoPlayerController.file((imagepicker[i]));
            _addProductController.initializeVideoPlayerFuture = _addProductController.controller.value.initialize();
            _addProductController.controller.value.setLooping(true);
            _addProductController.controller.value.setVolume(1.0);
          }
        }
      }
    }
    Future pickimagecamera() async {
      final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
      if (photo != null) {
        imagepk = File(photo.path);
        imagepicker.add(imagepk);
      }
    }
    Future pickimage() async {
      final List<XFile>? images = await ImagePicker().pickMultiImage();
      if (images != null) {
        for(int i=0;i<images.length;i++){
          imagepk = File(images[i].path);
          imagepicker.add(imagepk);
        }


      }
    }
    void showbottonsheet(){
      showModalBottomSheet(context: context,backgroundColor: Colors.transparent, builder: (context){
        return Container(
          height: 255,
          margin: const EdgeInsets.only(left: 5,right: 5),
          child: Column(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Thêm ảnh-video sản phẩm",style: TextStyle(color: Colors.grey,),),
                  onPressed: (){

                  },
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Chụp ảnh",style: TextStyle(color: Colors.blue,),),
                  onPressed: (){
                    pickimagecamera();
                  },
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Quay video",style: TextStyle(color: Colors.blue,),),
                  onPressed: (){
                    pickvideo();

                  },
                ),
              ),Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Thư viện ảnh",style: TextStyle(color: Colors.blue,),),
                  onPressed: (){
                    pickimage();
                    for(int i=0;i<imagepicker.length;i++){
                      if(imagepicker[i].toString().contains(".jpg")){
                        print("anh");
                      }
                      if(imagepicker[i].toString().contains(".mp4")){
                        print("video");
                      }
                    }
                  },
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Thư viện video",style: TextStyle(color: Colors.blue,),),
                  onPressed: (){

                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Hủy",style: TextStyle(color: Colors.black,),),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
        );
      });
    }
    return Container(
      color: Color.fromARGB(255, 241, 243, 253),
      child: Obx(
        () => SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imagepicker.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FutureBuilder(builder: (context, snapshot) {
                                if(imagepicker[index].toString().contains(".jpg")){
                                  return Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 5, left: 5, top: 5),
                                            color: Colors.red,
                                            child: Image.file(
                                              imagepicker[index],
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            width: 30,
                                            height: 30,
                                            left: 80,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20.0),
                                                color: Color.fromARGB(
                                                    255, 241, 243, 253),
                                                border: Border.all(
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                              ),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 12,
                                                ),
                                                onPressed: () {
                                                  imagepicker.removeAt(index);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      // Text(x.toString()),
                                    ],
                                  );
                                }else if(imagepicker[index].toString().contains(".mp4")){
                                  return Container(
                                    width: 100,
                                    child: FutureBuilder(
                                      future: hienvideo(),
                                      builder: (context, snapshot) {

                                        return Stack(
                                          children: [
                                            AspectRatio(
                                              aspectRatio: _addProductController.controller.value.value.aspectRatio,
                                              child: VideoPlayer(
                                                _addProductController.controller.value,
                                              ),
                                            ),
                                                Positioned(
                                                  child: Obx(()=>
                                                      Row(
                                                        children: [
                                                          TextButton(
                                                            child: Icon(_addProductController.playpause.value? Icons.pause:Icons.play_arrow),
                                                            onPressed: () {
                                                              if(_addProductController.controller.value.value.isPlaying){
                                                                _addProductController.controller.value.pause();
                                                                _addProductController.playpause.value=false;
                                                                _addProductController.cc.value="s";
                                                              }else{
                                                                _addProductController.controller.value.play();
                                                                _addProductController.playpause.value=true;
                                                                _addProductController.cc.value="x";
                                                              }

                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }else{
                                  return Text("cv");
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 110,
                          height: 90,
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text('add_image'.tr,
                                maxLines: 2, textAlign: TextAlign.center),
                            onPressed: () {
                              // x.value = x.value + " ";
                              showbottonsheet();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Tên sản phẩm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(_addProductController.demname.toString() + "/120"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập tên sản phẩm",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        maxLines: 2,
                        controller: _addProductController.name,
                        onChanged: (text) {
                          _addProductController.demname.value = text.length;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 100,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Mô tả sản phẩm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(_addProductController.demmotasanpham.toString() + "/3000"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập mô tả sản phẩm",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 3000,
                        maxLines: 2,
                        controller: _addProductController.motasanpham,
                        onChanged: (text) {
                          _addProductController.demmotasanpham.value = text.length;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Mã sản phẩm(SKU)"),
                      ),
                      Text("Mã sản phẩm(SKU)"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Yêu cầu hẹn trước")),
                      Text(_addProductController.textst.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: _addProductController.status.value,
                            onChanged: (val) {
                              _addProductController.status.value = !_addProductController.status.value;
                              if (_addProductController.status.value == true) {
                                _addProductController.textst.value = "có";
                              } else {
                                _addProductController.textst.value = "không";
                              }
                              print(_addProductController.status);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Số lượng nhập kho")),
                      // Text("0"),
                      Expanded(
                        child: TextField(
                          controller: _addProductController.soluongnhapkho,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (_addProductController.soluongnhapkho.text == "0") {
                              _addProductController.soluongnhapkho.text = "";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Ngày hết hạn")),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Obx(() => Text(_addProductController.date.value.day.toString() +
                                  "/" +
                                  _addProductController.date.value.month.toString() +
                                  "/" +
                                  _addProductController.date.value.year.toString())),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ImageIcon(
                                  AssetImage("assets/images/Icon/icon_date.png")),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          DateTime? newdate = await showDatePicker(
                            context: context,
                            initialDate: _addProductController.date.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          if (newdate != null) {
                            _addProductController.date.value = newdate;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  )),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Text('price'.tr),
                      Expanded(
                        child: TextField(
                          controller: _addProductController.gia,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (_addProductController.gia.text == "0") {
                              _addProductController.gia.text = "";
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                            controller: _addProductController.giakhuyenmai,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.red,
                              filled: true,
                              hintText: "Giá khuyến mại",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.white),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Số lượng còn lại"),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _addProductController.soluongconlai,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (_addProductController.soluongconlai.text == "0") {
                              _addProductController.soluongconlai.text = "";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(200, 200, 200, 200),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    children: [
                      Expanded(child: Text("Tình trạng kho hàng")),
                      Text("Còn hàng"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  var value = await Get.toNamed(Routes.STORE_MANAGER_SELECT_CATEGORY);
                  if(value != null){
                    _addProductController.listCategorySelected.addAll(value);
                  };
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text("Danh mục"),
                          )
                      ),
                      _addProductController.listCategorySelected.length > 0
                          ? Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _addProductController.listCategorySelected.length,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10, left: 10),
                                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                                        height: 40,
                                        child: Center(
                                          child: Text(_addProductController.listCategorySelected[index].name
                                              .toString()),
                                        ),
                                        color:
                                        Color.fromARGB(255, 241, 243, 253),
                                      ),
                                      Positioned(
                                          width: 20,
                                          height: 20,
                                          right: 0,
                                          top: 0,
                                          child: FloatingActionButton(
                                            child: Icon(Icons.close, size: 8,),
                                            onPressed: (){
                                              _addProductController.listCategorySelected
                                                  .removeAt(index);
                                            },
                                          )
                                      ),
                                    ],
                                  ),
                                );
                              })
                      )
                          : Row(children: [ Text("Chọn"), Icon(Icons.navigate_next)],)
                      // Text("Lựa chọn danh mục"),
                      // Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(200, 200, 200, 200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('display'.tr)),
                      Text("Danh mục, tìm kiếm"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),


              InkWell(
                onTap: () async {
                  var value = await Get.toNamed(Routes.STORE_MANAGER_SELECT_ORIGIN);
                  if(value != null){
                    _addProductController.tenxuatxu.value = value.toString();
                  };
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(200, 200, 200, 200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("Xuất xứ")),
                      Obx(()=> Text(_addProductController.tenxuatxu.value),),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(chonloaisanpham());
                },

                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(200, 200, 200, 200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('type_product'.tr)),
                      Text(_addProductController.clsp.lsp.toString()),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị sản phẩm")),
                      Text(_addProductController.textsthtsp.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: _addProductController.statushtsp.value,
                            onChanged: (val) {
                              _addProductController.statushtsp.value = !_addProductController.statushtsp.value;
                              if (_addProductController.statushtsp.value == true) {
                                _addProductController.textsthtsp.value = "có";
                              } else {
                                _addProductController.textsthtsp.value = "không";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị ở trang chính")),
                      Text(_addProductController.textsthttc.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: _addProductController.statushttc.value,
                            onChanged: (val) {
                              _addProductController.statushttc.value = !_addProductController.statushttc.value;
                              if (_addProductController.statushttc.value == true) {
                                _addProductController.textsthttc.value = "có";
                              } else {
                                _addProductController.textsthttc.value = "không";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('featured'.tr),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: new EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.only(right: 5, left: 10),

                        child: ElevatedButton(
                          child: Text('back'.tr),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.only(right: 10, left: 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.amber),
                          child: Text('save_info'.tr),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class chonloaisp extends GetxController {
  var lsp = "Chọn loại sp".obs;
}


class getdanhmuc extends GetxController {
  var danhmucsp = [].obs;
  var getdanhmuctid = [].obs;
  var dem = 0.obs;
  var nothing = [].obs;
  Future<List<Category>> fetchDanhmuc() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/Danhmucsanpham.php"));
    List<dynamic> list = json.decode(response.body);
    List<Category> pp = [];

    pp = list.map((e) => Category.fromJson(e)).toList();
    if (getdms.nothing.length == 0) {
      for (int i = 0; i < pp.length; i++) {
        getdms.nothing.add(danhmuc(
            title: pp[i].imageUrl.toString(),
            id: int.parse(pp[i].id.toString())));
      }
    }
    danhmucsp.value = pp;
    return pp;
  }
}



class getImagesp extends GetxController {
  final checkinternet CheckInternet = Get.put(checkinternet());
  var xuatxu = [].obs;
  var countqg = 0.obs;
  var idxs = 0.obs;
  var tenxuatxu = "Chọn xuất xứ".obs;
  Future<List<Origin>> fetchXuatxu() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/SelectImagesp.php"));
    List<Origin> pp = [];
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      pp = list.map((e) => Origin.fromJson(e)).toList();
      xuatxu.value = pp;
    }
    return pp;
  }
}