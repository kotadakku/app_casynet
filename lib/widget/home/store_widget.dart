
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreWidget extends StatefulWidget {
  const StoreWidget({Key? key}) : super(key: key);

  @override
  State<StoreWidget> createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget> {
  bool _isCar = true;
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
                    Image.asset("assets/home/store/icon_re2.png", width: 10, ),
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
                    Image.asset("assets/home/store/icon_re2.png", width: 10,),
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
                    Image.asset("assets/home/store/icon_re2.png", width: 10,),
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
              SvgPicture.asset("assets/home/store/phone.svg", width: 15,)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/home/store/icon_re2.png", width: 10,),
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
                  Image.asset("assets/home/store/icon_re2.png", width: 10,),
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


