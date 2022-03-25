
import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/containts/size.dart';
import 'package:app_casynet/controller/radio_car_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class StoreWidget extends StatelessWidget {
  RadioController c = Get.put(RadioController());
  StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Container(child: CircleAvatar(
                      child: Text(
                        "123",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      backgroundColor: Color(0xffDFB400),
                    ),),
                    SizedBox(width: 15,),
                    Text(
                      "Cửa hàng".toUpperCase(),
                      style: TextStyle(
                          color: Color(0xffDFB400),
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Xem thêm",
                      style: TextStyle(
                        color: Color(0xffB7BAC1),
                      ),
                    ),
                    SizedBox(width: 5,),
                    SvgPicture.asset("assets/home/store/icon_xemthem.svg", width: 5,),
                    SizedBox(width: 10,)
                  ],
                )

              ],
            ),
          ),

          SizedBox(height: 5, child: Container(color: Color(0xffF1F3FD),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(()=> Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: c.isCar.value,
                          onChanged: (value){
                            c.isCar.value = !c.isCar.value;
                          },
                          activeColor: Color(0xffDFB400)),
                      Text("Ô tô"),
                      SizedBox(width: 20,),
                      Radio(
                          value: false,
                          groupValue: c.isCar.value,
                          onChanged: (value){
                            c.isCar.value = !c.isCar.value;
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
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              ItemCuaHangWidget(
                  store_image: "assets/home/store/cuahang1.png",
                  distance: 4.5,
                  store_name: "Gara ô tô Vinaoto.net",
                  address: "Nam Từ Liêm, Hà Nội"
              ),
              ItemCuaHangWidget(
                  store_image: "assets/home/store/cuahang2.png",
                  distance: 4.5,
                  store_name: "Audi Việt Nam",
                  address: "Thanh Xuan, Hà Nội"
              ),
              ItemCuaHangWidget(
                  store_image: "assets/home/store/cuahang2.png",
                  distance: 4.5,
                  store_name: "Audi Việt Nam",
                  address: "Thanh Xuan, Hà Nội"
              ),
              ItemCuaHangWidget(
                  store_image: "assets/home/store/cuahang1.png",
                  distance: 4.5,
                  store_name: "Gara ô tô Vinaoto.net",
                  address: "Nam Từ Liêm, Hà Nội"
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCuaHangWidget extends StatelessWidget {
  final String store_image;
  final String store_name;
  final String address;
  final double distance;

  const ItemCuaHangWidget({
    Key? key, required this.store_image, required this.store_name, required this.address, required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) => Container(
      width: constraint.maxWidth/2-10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(store_image),
              Positioned(
                  child: Text("-20%")
              ),
              Positioned(
                  child: Text("-20%")
              )
            ],
            // Image.asset("")
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            color: Color(0xffEFF1FC),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_alt_rounded, color: kTextColor_gray, size: 12,),
                    SizedBox(width: 2,),
                    Text("33",
                        style: TextStyle(
                            fontSize: 10
                        )
                    )
                  ],
                ),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.comment, size: 12, color: kTextColor_gray,),
                    SizedBox(width: 2,),
                    Text("33",
                      style: TextStyle(
                        fontSize: 10
                      )
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share, color: kTextColor_gray, size: 10,),
                    SizedBox(width: 2,),
                    Text("4.5",
                        style: TextStyle(
                            fontSize: 10
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(store_name),
              FaIcon(FontAwesomeIcons.phoneFlip, color: kTextColor_gray, size: 12,),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.mapLocationDot, color: kTextColor_gray, size: 12,),
                  SizedBox(width: 3,),
                  Text(address,
                    style: TextStyle(
                        fontSize: 10
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  FaIcon(FontAwesomeIcons.locationArrow, color: kTextColor_gray, size: 12,),
                  SizedBox(width: 3,),
                  Text("$distance km",
                    style: TextStyle(
                        fontSize: 10
                    ),
                  )
                ],
              ),

            ],
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    ));
  }
}


