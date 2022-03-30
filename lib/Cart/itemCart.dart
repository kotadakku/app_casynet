import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
//Tên của hàng
        Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 255, 255, 255),
          height: 50,
          padding: EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              Icon(Icons.check_box, color: Colors.amberAccent,),
              Text(
                "Siêu Thị An Minh ",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.5),
//quà tặng cửa hàng
        Container(
          alignment: Alignment(0, 0),
          color: Color.fromARGB(255, 255, 255, 255),
          height: 50,
          padding: EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              Image.asset(
                "assets/cart/ic_gift.png",
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Quà Tặng Cửa Hàng ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/cart/icon_coin.png',
                      width: 20, height: 20),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Bạn Có 20000 Casycoin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 5.0))
                ],
              ))
            ],
          ),
        ),
        SizedBox(height: 0.5),
// list sản phẩm
        Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 255, 255, 255),
          padding:
              EdgeInsets.only(top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 4.0,
                  thickness: 1.0,
                );
              },
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_box,color: Color.fromARGB(
                          223, 223, 183, 0),),
                      SizedBox(
                        width: 2.0,
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset(
                          "assets/cart/img_rectangle.png",
                          width: 90,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.0,
                            child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
// tên sản phẩm
                                  Expanded(child: Text(
                                    "Máy rửa xe Catorex - CTR ssssssssssssss",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.1,
                                    ),
                                  ),),
// giá sản phẩm
                                  Text(
                                    "1.290.000 đ",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.3,
                                    ),
                                  )
                                ],
                              ),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Phân loại hàng",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 0.1,
                                  ),
                                ),
//Giá tiền txt
                                Text(
                                  "1.290.000 đ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w100,
                                    decoration: TextDecoration.lineThrough,
                                    letterSpacing: 0.3,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              padding: EdgeInsets.only(left: 0.0),
                              height: 30.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
// textfield số lượng sản phẩm
                                  Container(
                                    // transformAlignment: Center(key: ,),
                                    width: 20,
                                    height: 20,

                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
// button minus
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 235, 235, 255)),
                                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0.1)),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(20, 20)),
                                      ),
                                      child: Image.asset(
                                        "assets/cart/icon_minus2.png",
                                        width: 20, height: 10,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                    // style: ButtonStyle(
                                    //   backgroundColor:
                                    //       MaterialStateProperty.all<Color>(
                                    //           Color.fromARGB(
                                    //               255, 235, 235, 255)),
                                    //   // padding:
                                    //   //     MaterialStateProperty.all<EdgeInsets>(
                                    //   //         EdgeInsets.all(0.1)),
                                    //   minimumSize:
                                    //       MaterialStateProperty.all<Size>(
                                    //           Size(20, 20)),
                                    // ),
                                  ),

                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),

                                          // style: ButtonStyle(
                                          //   backgroundColor:
                                          //       MaterialStateProperty
                                          //           .all<Color>(Color.fromARGB(
                                          //               255, 235, 235, 255)),
                                          //   // padding: MaterialStateProperty.all<
                                          //   //         EdgeInsets>(
                                          //   //     EdgeInsets.all(0.1)),
                                          //   minimumSize:
                                          //       MaterialStateProperty.all<Size>(
                                          //           Size(20, 20)),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ))
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
