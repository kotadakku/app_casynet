
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../controller/store_manager/add_product/get_category_controller.dart';
import '../../../../../routes/app_pages.dart';

class DichVuSanPham extends StatefulWidget {
  const DichVuSanPham({Key? key}) : super(key: key);

  @override
  State<DichVuSanPham> createState() => _DichVuSanPhamState();
}

class _DichVuSanPhamState extends State<DichVuSanPham>
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
        AnimationController(vsync: this, duration: const Duration(seconds: 1, ));
    // _controller.forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }
  final getdms = Get.put(getdanhmuc());

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
                color: const Color.fromARGB(224, 224, 224, 224),
                margin: const EdgeInsets.only(top: 40, bottom: 40),
                child: const TextField(
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
              margin: const EdgeInsets.only(left: 10),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                // color: Colors.amber,
                child: Text("${'add'.tr} +"),
                onPressed: () {
                  getdms.getdanhmuctid.value = [];
                  getdms.dem.value = 0;
                  for (int i = 0; i < getdms.nothing.length; i++) {
                    getdms.nothing[i].checkdanhmuc = false;
                  }

                  Get.toNamed(Routes.STORE_MANAGER_ADD_PRODUCT);
                },
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => Container(
          color: const Color.fromARGB(255, 241, 243, 253),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
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
                      Text('delete'.tr),
                      Text("20 ${'record'.tr}"),
                    ],
                  ),
                ),
                AnimatedList(
                  key: _key,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  initialItemCount: 6,
                  itemBuilder: (context, index,animated) {
                    return Obx(
                      () => Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Color.fromRGBO(200, 200, 200, 200)),
                              )),
                              height: 50,
                              child: Row(
                                children: const [
                                  Expanded(
                                      child:
                                          Text("Bảo hiểm vận chuyển hàng hóa")),
                                  ImageIcon(
                                    AssetImage("assets/images/Icon/icon_butchi.png"),
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
                                      label: 'delete'.tr,
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
                                    margin: const EdgeInsets.only(right: 10),
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
                                              margin: const EdgeInsets.only(),
                                              child: const Text("Mã: 01-303",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(right: 5),
                                              child: Text("${'amount'.tr}:1000",
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
                                                margin: const EdgeInsets.only(),
                                                child: Text("${'type'.tr}: Sản phẩm",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(right: 5),
                                              child: Text("${'price'.tr}: 1.000.000",
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
                                                child: Text("${'type_product'.tr}: xe máy\nNgày hết hạn: 15/10/2025\nNổi bật: có\nXuất xứ: Việt Nam\nYêu cầu hẹn trước: có",maxLines: maxliness[index],),
                                              ),
                                            Container(
                                              margin: const EdgeInsets.only(right: 5),
                                              child: InkWell(
                                                child: Text(xemthugon[index],style: const TextStyle(color: Colors.blue),),
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
