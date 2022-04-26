
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../Appbar.dart';
import '../../UI_cuahang.dart';
import 'UI_ThemSPDV.dart';

class dichvusanpham extends StatefulWidget {
  @override
  State<dichvusanpham> createState() => _dichvusanphamState();
}

class _dichvusanphamState extends State<dichvusanpham>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  var x = "".obs;
  var xemthugon = ["Xem","Xem","Xem","Xem","Xem","Xem","Xem","Xem"].obs;
  var maxlines=1.obs;
  var maxliness=[1,1,1,1,1,1,1].obs;
  var iscs = [false, false, false, false, false, false, false].obs;
  final GlobalKey<AnimatedListState> _key=GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1, ));
    // _controller.forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                color: Color.fromARGB(224, 224, 224, 224),
                margin: new EdgeInsets.only(top: 40, bottom: 40),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm trên cửa hàng',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              margin: new EdgeInsets.only(left: 10),
              child: RaisedButton(
                color: Colors.amber,
                child: Text("Thêm +"),
                onPressed: () {
                  getdms.getdanhmuctid.value = [];
                  getdms.dem.value = 0;
                  for (int i = 0; i < getdms.nothing.length; i++) {
                    getdms.nothing[i].checkdanhmuc = false;
                  }

                  Get.to(themspdv());
                },
              ),
            ),
          ],
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.to(menucuahang());
            },
          ),
        ),
      ),
      body: Obx(
        () => Container(
          color: Color.fromARGB(255, 241, 243, 253),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: false,
                          onChanged: (value) {
                            // iscs[index] = value!;
                          },
                        ),
                      ),
                      Text("Xóa "),
                      Text("20 Bản ghi"),
                    ],
                  ),
                ),
                AnimatedList(
                  key: _key,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  initialItemCount: 6,
                  itemBuilder: (context, index,animated) {
                    return Obx(
                      () => Container(
                        color: Colors.white,
                        margin: new EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              margin: new EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Color.fromRGBO(200, 200, 200, 200)),
                              )),
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child:
                                          Text("Bảo hiểm vận chuyển hàng hóa")),
                                  ImageIcon(
                                    AssetImage("assets/Icon/icon_butchi.png"),
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                extentRatio: 0.25,
                                children: [
                                  Container(
                                    child: SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.white,
                                      label: 'Xóa',
                                    ),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(x.toString()),
                                  Checkbox(
                                    value: iscs[index],
                                    onChanged: (value) {
                                      iscs[index] = value!;
                                    },
                                  ),
                                  Container(
                                    margin: new EdgeInsets.only(right: 10),
                                    child: Image.network(
                                      "https://image.bnews.vn/MediaUpload/Org/2020/10/29/winner-x-bike-sport.jpg",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: new EdgeInsets.only(),
                                              child: Text("Mã: 01-303",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Container(
                                              margin: new EdgeInsets.only(right: 5),
                                              child: Text("Số lượng:1000",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: new EdgeInsets.only(),
                                                child: Text("Loại: Sản phẩm",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Container(
                                              margin: new EdgeInsets.only(right: 5),
                                              child: Text("Giá: 1.000.000",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                              Expanded(
                                                child: Container(
                                                  child: Text("Loại sản phẩm: xe máy\nNgày hết hạn: 15/10/2025\nNổi bật: có\nXuất xứ: Việt Nam\nYêu cầu hẹn trước: có",maxLines: maxliness[index],),
                                                ),
                                              ),
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: InkWell(
                                                child: Text(xemthugon[index],style: TextStyle(color: Colors.blue),),
                                                onTap: () {
                                                  if(maxliness[index]==1){
                                                    maxliness[index]=5;
                                                    xemthugon[index]="Thu gọn";
                                                  }else{
                                                    maxliness[index]=1;
                                                    xemthugon[index]="Xem";
                                                  }


                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizeTransition(sizeFactor: sizeFactor),
                                        // ExpansionTile(
                                        //   expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                        //   expandedAlignment: Alignment.bottomLeft,
                                        //
                                        //   title: Row(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.end,
                                        //     children: [
                                        //       Expanded(
                                        //         child: Container(
                                        //           margin: new EdgeInsets.only(),
                                        //           child: Text(
                                        //             "Loại Sản phẩm: xe máy",
                                        //             maxLines: 1,
                                        //             overflow:
                                        //                 TextOverflow.ellipsis,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Expanded(
                                        //         child: Container(
                                        //           child: Text("Xem"),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   children: [
                                        //     Text("sa1"),
                                        //     Text("sa2"),
                                        //     Text("sa3"),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Text(x.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
