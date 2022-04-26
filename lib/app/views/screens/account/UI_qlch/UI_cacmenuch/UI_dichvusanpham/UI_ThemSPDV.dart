import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../data/model/Danhmucsanpham.dart';
import '../../../../../../data/model/Sanpham.dart';
import '../../../../../../data/model/Xuatxu.dart';
import '../../CheckInternet.dart';
import 'UI_Chondanhmuc.dart';
import 'UI_Chonloaisanpham.dart';
import 'UI_Chonxuatxu.dart';
import 'UI_Dichvusanpham.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'danhmuc.dart';

class themspdv extends StatefulWidget {
  @override
  State<themspdv> createState() => _themspdvState();
}

final getdms = Get.put(getdanhmuc());

class _themspdvState extends State<themspdv> {
  var _date = new DateTime.now().obs;
  final clsp = Get.put(chonloaisp());
  final GetXuatxu = Get.put(getxuatxu());
  final tensanpham = TextEditingController();
  final motasanpham = TextEditingController();
  final soluongnhapkho = TextEditingController();
  final soluongconlai = TextEditingController();
  final gia = TextEditingController();
  final giakhuyenmai = TextEditingController();
  var demtensanpham = 0.obs;
  var demmotasanpham = 0.obs;
  var status = false.obs;
  var statushtsp = false.obs;
  var statushttc = false.obs;
  var textst = "không".obs;
  var textsthtsp = "không".obs;
  var textsthttc = "không".obs;
  var chon = "".obs;
  var cc="".obs;
  var _controller=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4").obs;
  late Future<void> _initializeVideoPlayerFuture;
  var playpause = false.obs;
  @override
  void initState() {
    super.initState();
    soluongnhapkho.text = 0.toString();
    soluongconlai.text = 0.toString();
    gia.text = 0.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Thêm Dịch vụ/ Sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.to(dichvusanpham());
            },
          ),
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
            _controller.value = VideoPlayerController.file((imagepicker[i]));
            _initializeVideoPlayerFuture = _controller.value.initialize();
            _controller.value.setLooping(true);
            _controller.value.setVolume(1.0);
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
          margin: EdgeInsets.only(left: 5,right: 5),
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
                                        overflow: Overflow.visible,
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
                                              aspectRatio: _controller.value.value.aspectRatio,
                                              child: VideoPlayer(
                                                _controller.value,
                                              ),
                                            ),
                                                Positioned(
                                                  child: Obx(()=>
                                                      Row(
                                                        children: [
                                                          TextButton(
                                                            child: Icon(playpause.value? Icons.pause:Icons.play_arrow),
                                                            onPressed: () {
                                                              if(_controller.value.value.isPlaying){
                                                                _controller.value.pause();
                                                                playpause.value=false;
                                                                cc.value="s";
                                                              }else{
                                                                _controller.value.play();
                                                                playpause.value=true;
                                                                cc.value="x";
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
                              side: BorderSide(
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text("Thêm ảnh/ video",
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
                            child: Text(demtensanpham.toString() + "/120"),
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
                        controller: tensanpham,
                        onChanged: (text) {
                          demtensanpham.value = text.length;
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
                            child: Text(demmotasanpham.toString() + "/3000"),
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
                        controller: motasanpham,
                        onChanged: (text) {
                          demmotasanpham.value = text.length;
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
                      Text(textst.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: status.value,
                            onChanged: (val) {
                              status.value = !status.value;
                              if (status.value == true) {
                                textst.value = "có";
                              } else {
                                textst.value = "không";
                              }
                              print(status);
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
                          controller: soluongnhapkho,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (soluongnhapkho.text == "0") {
                              soluongnhapkho.text = "";
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
                              child: Obx(() => Text(_date.value.day.toString() +
                                  "/" +
                                  _date.value.month.toString() +
                                  "/" +
                                  _date.value.year.toString())),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ImageIcon(
                                  AssetImage("assets/Icon/icon_date.png")),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          DateTime? newdate = await showDatePicker(
                            context: context,
                            initialDate: _date.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          if (newdate != null) {
                            _date.value = newdate;
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
                      Text("Giá"),
                      Expanded(
                        child: TextField(
                          controller: gia,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (gia.text == "0") {
                              gia.text = "";
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                            controller: giakhuyenmai,
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
                          controller: soluongconlai,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (soluongconlai.text == "0") {
                              soluongconlai.text = "";
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
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Tình trạng kho hàng")),
                      Text("Còn hàng"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Danh mục")),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: getdms.getdanhmuctid.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(right: 5, left: 5),
                                        height: 30,
                                        child: Center(
                                          child: Text(getdms
                                              .getdanhmuctid[index].title
                                              .toString()),
                                        ),
                                        color:
                                            Color.fromARGB(255, 241, 243, 253),
                                        // decoration: BoxDecoration(
                                        //     border: Border.all(color: Colors.black)
                                        // ),
                                      ),
                                      Positioned(
                                        width: 20,
                                        height: 20,
                                        right: -8,
                                        top: -8,
                                        child: ClipOval(
                                          child: Material(
                                            color: Color.fromARGB(255, 241, 243,
                                                253), // Button color
                                            child: InkWell(
                                              splashColor: Colors.red,
                                              onTap: () {
                                                getdms.getdanhmuctid
                                                    .removeAt(index);
                                              },
                                              child: SizedBox(
                                                  child: Icon(
                                                Icons.close,
                                                size: 10,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      // Text("Lựa chọn danh mục"),
                      // Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chondanhmuc());
                  },
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị")),
                      Text("Danh mục, tìm kiếm"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Xuất xứ")),
                      Text(GetXuatxu.tenxuatxu.toString()),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chonxuatxu());
                  },
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Loại sản phẩm")),
                      Text(clsp.lsp.toString()),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chonloaisanpham());
                  },
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
                      Text(textsthtsp.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: statushtsp.value,
                            onChanged: (val) {
                              statushtsp.value = !statushtsp.value;
                              if (statushtsp.value == true) {
                                textsthtsp.value = "có";
                              } else {
                                textsthtsp.value = "không";
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
                      Text(textsthttc.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => CupertinoSwitch(
                            value: statushttc.value,
                            onChanged: (val) {
                              statushttc.value = !statushttc.value;
                              if (statushttc.value == true) {
                                textsthttc.value = "có";
                              } else {
                                textsthttc.value = "không";
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
                        child: Text("Nổi bật"),
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
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text("Trở lại"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.only(right: 10, left: 5),
                        child: RaisedButton(
                          color: Colors.amber,
                          child: Text("Lưu thông tin"),
                          onPressed: () {
                            var array = [];
                            var c = Sanpham.s(
                                "vbn",
                                tensanpham.text,
                                motasanpham.text,
                                soluongnhapkho.text,
                                gia.text,
                                giakhuyenmai.text,
                                soluongconlai.text,
                                GetXuatxu.idxs.toString(),
                                "loaisanpham",
                                status.toString(),
                                _date.value.day.toString() +
                                    "/" +
                                    _date.value.month.toString() +
                                    "/" +
                                    _date.value.year.toString(),
                                statushtsp.toString(),
                                statushttc.toString(),
                                "hienthiotrangchinh");
                            print(c.toJson());
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

// class getdanhmuc extends GetxController {
//   var ischeck = false.obs;
//   var danhmucs = [].obs;
//   var getdanhmuctid = [].obs;
//   var dem = 0.obs;
//   Future fetchdanhmucsp() async {
//     final response = await http.get(Uri.parse(
//         "https://coaxial-typewriter.000webhostapp.com/Server/Danhmucsanpham.php"));
//     if (response.statusCode == 200) {
//       var list = json.decode(response.body);
//       getdms.danhmucs.value =
//           list.map((e) => Danhmucsanpham.fromJson(e)).toList();
//       if (getdms.danhmucs.value != null) {
//         ischeck.value = true;
//       }
//     }
//   }
// }
class getdanhmuc extends GetxController {
  var danhmucsp = [].obs;
  var getdanhmuctid = [].obs;
  var dem = 0.obs;
  var nothing = [].obs;
  Future<List<Danhmucsanpham>> fetchDanhmuc() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/Danhmucsanpham.php"));
    List<dynamic> list = json.decode(response.body);
    List<Danhmucsanpham> pp = [];

    pp = list.map((e) => Danhmucsanpham.fromJson(e)).toList();
    if (getdms.nothing.length == 0) {
      for (int i = 0; i < pp.length; i++) {
        getdms.nothing.add(danhmuc(
            title: pp[i].tendanhmuc.toString(),
            id: int.parse(pp[i].iddanhmuc.toString())));
      }
    }
    danhmucsp.value = pp;
    return pp;
  }
}

class getxuatxu extends GetxController {
  final checkinternet CheckInternet = Get.put(checkinternet());
  var xuatxu = [].obs;
  var countqg = 0.obs;
  var idxs = 0.obs;
  var tenxuatxu = "Chọn xuất xứ".obs;
  Future<List<Xuatxu>> fetchXuatxu() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/Xuatxu.php"));
    List<Xuatxu> pp = [];
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      pp = list.map((e) => Xuatxu.fromJson(e)).toList();
      xuatxu.value = pp;
    }
    return pp;
  }
}

class getImagesp extends GetxController {
  final checkinternet CheckInternet = Get.put(checkinternet());
  var xuatxu = [].obs;
  var countqg = 0.obs;
  var idxs = 0.obs;
  var tenxuatxu = "Chọn xuất xứ".obs;
  Future<List<Xuatxu>> fetchXuatxu() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/SelectImagesp.php"));
    List<Xuatxu> pp = [];
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      pp = list.map((e) => Xuatxu.fromJson(e)).toList();
      xuatxu.value = pp;
    }
    return pp;
  }
}