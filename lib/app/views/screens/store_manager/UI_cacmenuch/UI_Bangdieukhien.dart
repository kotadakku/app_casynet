import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Appbar.dart';

class BangDieuKhien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heightdon = 540.obs;
    var tinh = 0.obs;
    var ss = "".obs;
    int sopt=10;
    final widthdt = MediaQuery.of(context).size.width;
    final heightdt = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Appbars(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(255, 241, 243, 253),
                child: Wrap(
                  children: [
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin:
                          new EdgeInsets.only(right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "30.000",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  'turnover'.tr,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin: new EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "3250",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  'sold'.tr,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin:
                          new EdgeInsets.only(right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "3000",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  'total_order'.tr,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin: new EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "3250",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  'total_products'.tr,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin:
                          new EdgeInsets.only(right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  "Đã bán hôm nay",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "30",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin: new EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  "Doanh số hôm nay",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "3.250.000",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin:
                          new EdgeInsets.only(right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  "Đã bán trong tháng",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "400",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: widthdt / 2 - 15,
                      color: Colors.white,
                      margin: new EdgeInsets.only(right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: new EdgeInsets.only(left: 10),
                                child: Text(
                                  "Doanh số trong tháng",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                margin: new EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "6.250.000",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: new EdgeInsets.only(left: 15),
                            child: ImageIcon(
                              AssetImage("assets/images/Icon/icon_doanhso.png"),
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(200, 200, 200, 200),
                height: 300,
                child: Column(
                  children: [
                    Container(
                      margin: new EdgeInsets.only(top: 10),
                      height: 10,
                    ),
                  ],
                ),
              ),
              DefaultTabController(length: 3,
                  child: Column(
                    children: [
                      Obx(
                            () => Container(
                          color: Color.fromRGBO(200, 200, 200, 200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                height: 40,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: new EdgeInsets.only(top: 10, left: 10),
                                          height: 40,
                                          child: TabBar(
                                            isScrollable: true,
                                            indicatorColor: Colors.amber,
                                            labelColor: Colors.amber,
                                            unselectedLabelColor: Colors.black,
                                            tabs: [
                                              Tab(
                                                text: "Đơn hàng cuối",
                                              ),
                                              Tab(
                                                text: "Bán chạy nhất",
                                              ),
                                              Tab(
                                                text: "Sản phẩm được xem",
                                              ),
                                            ],
                                            onTap: (indext) {
                                              print(indext);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: heightdon.toDouble(),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Column(
                                      children: [
                                        DataTable(
                                          columns: [
                                            DataColumn(
                                              label: Text('#'),
                                            ),
                                            DataColumn(
                                              label: Text('Ngày đặt hàng'),
                                            ),
                                            DataColumn(
                                              label: Text('Khách hàng'),
                                            ),
                                            DataColumn(
                                              label: Text('Tổng tiền hàng'),
                                            ),
                                            DataColumn(
                                              label: Text('Hiện thị'),
                                            ),
                                          ],
                                          rows: _createRows(sopt),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(()=>Container(
                        margin: new EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        width: widthdt,

                        child: ElevatedButton (
                          style: ElevatedButton.styleFrom(primary: Colors.amber),
                          child: Text('more'.tr+ss.toString()),
                          onPressed: () {
                            heightdon = heightdon + 500-tinh.toInt();

                            sopt=sopt+10;
                            tinh=20.obs;
                          },
                        ),
                      )),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Bottommenu(),
    );
  }
}

class hoadon extends StatelessWidget {
  const hoadon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<DataRow> _createRows(int x) {
  List<DataRow> dr = [];
  for (int i = 1; i <= x; i++) {
    DataRow oo;
    oo = DataRow(
      cells: [
        DataCell(Text(i.toString())),
        DataCell(Text('06/09/2021')),
        DataCell(Text('Ngọc Bích')),
        DataCell(Text('2.000.000')),
        DataCell(ImageIcon(AssetImage("assets/images/Icon/icon_dung.png"),color: Colors.green,)),
      ],
    );
    dr.add(oo);
  }
  return dr;
}
