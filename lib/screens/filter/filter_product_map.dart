import 'package:app_casynet/theme/app_colors.dart';
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class FilterProductMap extends StatelessWidget {
  const FilterProductMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isCar = true.obs;
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
                      Obx(()=>Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _isCar.value,
                              onChanged: (value){
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)),
                          Text("Ô tô"),
                          SizedBox(width: 20,),
                          Radio(
                              value: false,
                              groupValue: _isCar.value,
                              onChanged: (value){
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)
                          ),

                          Text("Xe máy")
                        ],
                      ))
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
                child: Image.asset("assets/filter/image83.png", fit: BoxFit.fitHeight, height: double.infinity,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("assets/account/image_user.png"),
                        )
                    ),
                    title: Text("Vị trí của tôi", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text("165 Vũ Phạm Hàm, Yên Hòa, Cầu Giấy...",
                      style: TextStyle(
                          color: kTextColor_gray,
                          fontSize: 12
                      ),
                    ),
                    trailing: Text("Sửa",
                      style: TextStyle(
                          color: kTextLink
                      ),
                    ),
                  ),
                  Divider(
                      height: 5
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("Danh sách cửa hàng bạn cần tìm",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),

                  ),
                  Divider(
                      height: 5
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("assets/account/image_user.png"),
                        )
                    ),
                    title: Text("Gara Ô Tô Hà Nội Car Sevices"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("số 2 Phố Trần Hữu Dực, Mỹ Đình, Từ Liêm, Hà Nội",
                          style: TextStyle(
                              color: kTextColor_gray,
                              fontSize: 12
                          ),
                        ),
                        Row(children: [
                          Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.all(5.0),
                            child: Icon(Icons.add),
                          ),
                          Text("Vào cửa hàng"),
                        ],)
                      ],
                    ),
                  ),
                ],
              )



            ],
          ),
        )
    );
  }
}
