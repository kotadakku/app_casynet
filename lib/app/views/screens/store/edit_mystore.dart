import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class EditMyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var open_hours = "Thiết lập".obs;
    var close_hours = "Thiết lập".obs;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   // flex: 1,
                    //   child: SizedBox(width: 30,),
                    // ),
                    Expanded(
                        child:Center(
                          child: Text(
                            "Sửa thông tin cửa hàng",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),)
                        )

                    )


                  ],
                ),
              ),
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    Center(
                        child: Column(
                          children: [

// Ảnh đại diện
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  color: Color.fromARGB(255, 241, 222, 144),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                "assets/store/img_mask_group_14.png"),
                                          ),
                                          shape: BoxShape.circle),
                                      width: 100,
                                      height: 100,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          _tripEditModalBottomSheet(context);
                                        },
                                        child: Text(
                                          "Sửa",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              width: 2.0,
                                              color: Color.fromARGB(255, 223, 180, 0)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          elevation: 10,
                                          padding: EdgeInsets.only(bottom: 10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 96, 88, 57),
                              height: 50,
                              child: const Text(
                                "Chạm để thay đổi",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Column(
                      children: [
//Nhập Tên cửa hàng
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text("Tên cửa hàng",
                                      style: TextStyle(
                                          color:
                                          Color.fromARGB(255, 127, 141, 171)))),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // suffixIcon: Icon(Icons.navigate_next),

                                    hintText: 'Nhập tên cửa hàng',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Nhập link cửa hàng
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text("Đường link cửa hàng",
                                      style: TextStyle(
                                          color:
                                          Color.fromARGB(255, 127, 141, 171)))),
                              Expanded(
                                // flex: 2,
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // suffixIcon: Icon(Icons.navigate_next),

                                    hintText: 'VD: Garaptp-bao-viet',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Số điện thoại
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text("Số điện thoại",
                                      style: TextStyle(
                                          color:
                                          Color.fromARGB(255, 127, 141, 171)))),
                              Expanded(
                                child: TextField(
                                  autofocus: false,
                                  maxLength: 11,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // suffixIcon: Icon(Icons.navigate_next),
                                    counterText: "", // hide counter

                                    hintText: 'Nhập số điện thoại',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Giờ mở cửa
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              onTap: () {
                                DatePicker.showTimePicker(context,
                                    showTitleActions: true,
                                    // onChanged: (s) {
                                    //   open_hours.value = DateFormat('HH-mm').format(s).toString();
                                    //   print(open_hours);
                                    // },
                                    onConfirm: (s) {
                                      open_hours.value =
                                          DateFormat('HH:mm').format(s).toString();
                                    },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.vi);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Giờ mở cửa",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 127, 141, 171)))
                                        ],
                                      )),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Obx(
                                                () => Text(
                                              open_hours.value,
                                            ),
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Giờ đóng cửa
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {
                                DatePicker.showTimePicker(context,
                                    showTitleActions: true,
                                    // onChanged: (s) {
                                    //   close_hours.value = DateFormat('HH-mm').format(s).toString();
                                    //   print(open_hours);
                                    // },
                                    onConfirm: (s) {
                                      close_hours.value =
                                          DateFormat('HH:mm').format(s).toString();
                                    },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.vi);
                              },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Giờ đóng cửa",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 127, 141, 171)))
                                        ],
                                      )),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Obx(
                                                () => Text(
                                              close_hours.value,
                                            ),
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Danh mục ngành nghề chính
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Danh mục ngành nghề chính",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "- Chọn -",
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Danh mục nghề khác
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Danh mục nghề khác",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "- Chọn -",
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Loại hình
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Loại hình",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "- Chọn -",
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Tỉnh/Thành Phố
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tỉnh/Thành Phố",
                                        style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Hà Nội",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Quận/Huyện
                        Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Quận/Huyện",
                                        style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Thanh Xuân",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          Icon(Icons.navigate_next),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0, right: 5.0),
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Địa chỉ cửa hàng
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Địa chỉ cửa hàng",
                                      style: TextStyle(
                                          color:
                                          Color.fromARGB(255, 127, 141, 171)))
                                ],
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Số nhà/Khu Phố/Phường',
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Liên kết mạng xã hội
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Liên kết mạng xã hội",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Thêm +",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 0, 85, 170),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//facebook
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Gắn link",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//zalo
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Zalo",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Gắn link",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Youtube
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Youtube",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Gắn link",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Mô tả ngắn
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {
                            // Get.to(ShortDescription());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mô tả ngắn",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Chi tiết về về cửa hàng
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chi tiết về cửa hàng",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
// check box đồng ý điều khoản
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.check_box_outline_blank),
                              ],
                            ),
                            Row(
                              children: [
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Tôi đồng ý với các ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'điều khoản',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      TextSpan(
                                        text: ' của CASYNET',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]))
                              ],
                            )
                          ],
                        )),
// btn xem trước và Tạo cửa hàng
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      height: 70.0,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Color.fromARGB(255, 223, 180, 0)),
                                    backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                    primary: Color.fromARGB(255, 223, 180, 0),
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // Get.to();
                                  },
                                  child: const Text(
                                    'Xem trước',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 223, 180, 0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                height: 50,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                    Color.fromARGB(255, 223, 180, 0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // Get.to(NewCreatedStore());
                                  },
                                  child: const Text(
                                    'Tạo cửa hàng',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),)
            ],
          )
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
            child:
             Wrap(
              children: [
              Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          // padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sửa hình đại diện",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 188, 195, 216),
                                    fontSize: 15),
                              ),
                            ],)
                      ),
                      Divider(
                        height: 2.0,
                      ),
                      Expanded(
                          flex: 1,
                          // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
                          child: InkWell(
                              onTap: () {
                              },
                              // splashColor: Colors.black26,
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sửa",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 85, 170),
                                        fontSize: 15),
                                  )
                                ],
                              ))),

                      Divider(
                        height: 2.0,
                      ),
                      Expanded(
                          flex: 1,
                          // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
                          child: InkWell(
                              onTap: () {
                                print("Chụp ảnh");
                              },
                              // splashColor: Colors.black26,
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Chụp ảnh",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 85, 170),
                                        fontSize: 15),
                                  )
                                ],
                              ))),

                      Divider(
                        height: 2.0,
                      ),
                      Expanded(
                          flex: 1,
                          // padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5.0,right: 5.0),
                          child: InkWell(
                              onTap: () {
                              },
                              // splashColor: Colors.black26,
                              splashColor: Color.fromARGB(255, 188, 195, 216),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Chọn có sẵn",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 85, 170),
                                        fontSize: 15),
                                  )
                                ],
                              ))),




                    ],
                  ),
                ),
                Divider(
                  height: 5.0,

                ),
                Container(
                  // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        // splashColor: Colors.black26,
                        splashColor: Color.fromARGB(255, 188, 195, 216),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
