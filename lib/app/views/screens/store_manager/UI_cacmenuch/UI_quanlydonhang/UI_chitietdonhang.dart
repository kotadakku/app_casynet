
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChiTietDonHang extends StatelessWidget {
  const ChiTietDonHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSelected = [true, false, false, false].obs;
    var x="".obs;
    Future Showpopuphuydon() => showDialog(
          context: context,
          builder: (context) => Center(
            child: AlertDialog(
              title: const Text(
                "Hủy đơn hàng",
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: 250,
                child: Center(
                  child: Column(
                    children: [
                      const Text("Bạn có chắc muốn hủy bỏ đơn đặt hàng này không?",
                          textAlign: TextAlign.center),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: const SingleChildScrollView(
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Lý do bạn muốn hủy đơn hàng này",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.amber),
                          child: const Text(
                            "Ok",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Chi tiết đơn hàng",
          style: TextStyle(color: Colors.amber),
        ),
        leading: Container(
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              color: const Color.fromARGB(121, 205, 205, 255),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thông tin khách hàng",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 10),
                    child: const Text(
                      "Trần Thế Quyền",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const Text("097474555"),
                  ),
                  const Text("HN Unknown Hà Nội - Việt Nam"),
                ],
              ),
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(121, 205, 205, 255),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Thông tin đơn hàng",
                        style:  TextStyle(fontSize: 18)),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text(
                        "Đợi duyệt",
                        style:  TextStyle(color: Colors.amber, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom:  BorderSide(
                          width: 1.0,
                          color:  Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Image.network(
                              "https://image.bnews.vn/MediaUpload/Org/2020/10/29/winner-x-bike-sport.jpg",
                              width: 100,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Bảo Hiểm Bắt buộc - Tự Nguyện",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Xe Gắn Máy",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Hẹn trước:10:00, 01/10/2021",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: const [
                                Text(
                                  "x1",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "60.000",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  "80.000",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      decoration:
                                          TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Tổng tiền hàng"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Vận chuyển & sử lý"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Chiếu khấu"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text('sub_total'.tr),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("240.000"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("10.000"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("80.000"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "250.000",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(121, 205, 205, 255),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PHUƠNG THỨC THANH TOÁN",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Obx(
              () => Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width-100,
                    child: DefaultTabController(
                      length: 4,
                      child: TabBar(
                        indicatorColor: Colors.amber,
                        tabs: [
                          Tab(
                            child: SizedBox(
                              width: 60,
                              child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png"),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: 60,
                              child: Image.network("https://taichinh.online/wp-content/uploads/2017/02/the-mastercard.png"),
                            ),
                          ),
                          Tab(
                            child:SizedBox(
                              width: 60,
                              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXJp5JAM724arqL1PuHZCCrXMS_LG5barn6dOqRETUiAn5hxa9AQjCNctYuJ0mUjYGi8M&usqp=CAU"),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: 60,
                              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/PayPal_logo.svg/2560px-PayPal_logo.svg.png"),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  Text(x.toString()),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                  "Phương thức thanh toán do Chủ Cửa Hàng và Người Dùng tự thỏa thuận"),
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(121, 205, 205, 255),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('code_order'.tr.toUpperCase()),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text("#000000372"),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Thời gian đặt hàng"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("Thời gian thanh toán"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("TG giao hàng và vận chuyển"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("06:59:28, 1/10/2021"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("06:59:28, 1/10/2021"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text("06:59:28, 1/10/2021"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: const Text("Hủy đơn hàng"),
                        onPressed: () {
                          Showpopuphuydon();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        child: Text('confirm'.tr),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
