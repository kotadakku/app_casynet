import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterProductMap extends StatefulWidget {
  const FilterProductMap({Key? key}) : super(key: key);

  @override
  State<FilterProductMap> createState() => _FilterProductMapState();
}

class _FilterProductMapState extends State<FilterProductMap> {
  @override
  Widget build(BuildContext context) {
    bool _isCar = false;
    return SafeArea(
      child: Scaffold(
        body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TopAccountWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(child: CircleAvatar(
                    child: Text(
                      "123",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    backgroundColor: Color(0xffDFB400),
                  ),),
                  Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: _isCar,
                          onChanged: (value){
                            setState(() {
                              _isCar = !_isCar;
                            });
                          },
                          activeColor: Color(0xffDFB400)),
                      Text("Ô tô"),
                      SizedBox(width: 20,),
                      Radio(
                          value: false,
                          groupValue: _isCar,
                          onChanged: (value){
                            setState(() {
                              _isCar = !_isCar;
                            });
                          },
                          activeColor: Color(0xffDFB400)
                      ),
                      Text("Xe máy")
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/home/store/icon_filter.svg", width: 15,),
                  SizedBox(width: 5,),
                  Text(
                    "Lọc",
                    style: TextStyle(
                      color: Color(0xffB7BAC1),
                    ),
                  ),
                  SizedBox(width: 10,)
                ],
              )
            ],
          ),
          Expanded(
              child: Stack(
                // fit: StackFit.loose,
                children: [
                  Image.asset("assets/filter/image83.png", fit: BoxFit.fitHeight, height: double.infinity,),
                  Positioned(
                    bottom:0,
                    child: Container(
                      color: Colors.white,
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Text("123"),
                            title: Text("Vị trí của tôi"),
                            subtitle: Text("165 Vũ Phạm Hàm, Yên Hòa, Cầu Giấy..."),
                            trailing: Text("Sửa"),
                          ),
                          Text("Danh sách cửa hàng bạn cần tìm"),
                          ListTile(
                            leading: Text("123"),
                            title: Text("Gara Ô Tô Hà Nội Car Sevices"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("số 2 Phố Trần Hữu Dực, Mỹ Đình, Từ Liêm, Hà Nội"),
                                Row(children: [
                                  Icon(Icons.add),
                                  Text("Vào cửa hàng"),
                                ],)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),)

                ],
              )
          )



        ],
      ),
      )
    );
  }
}
