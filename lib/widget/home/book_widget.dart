
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookWidget extends StatefulWidget {
  final String title;
  const BookWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
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
                      widget.title.toUpperCase(),
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
              ItemBookWidget(
                  book_image: "assets/home/book/image.png",
                  distance: 4.5,
                  price: "1.290.000đ",
                  price_discount: "1.390.000đ",
                  book_name: "Máy rửa xe Catorex - CTR",
                  book_category: "Điện máy Đỗ Dũng"
              ),
              ItemBookWidget(
                  book_image: "assets/home/store/cuahang1.png",
                  distance: 4.5,
                  price: "1.290.000đ",
                  price_discount: "1.390.000đ",
                  book_name: "Máy rửa xe Catorex - CTR",
                  book_category: "Điện máy Đỗ Dũng"
              ),
              ItemBookWidget(
                  book_image: "assets/home/book/image.png",
                  distance: 4.5,
                  price: "1.290.000đ",
                  price_discount: "1.390.000đ",
                  book_name: "Máy rửa xe Catorex - CTR",
                  book_category: "Điện máy Đỗ Dũng"
              ),
              ItemBookWidget(
                  book_image: "assets/home/store/cuahang1.png",
                  distance: 4.5,
                  price: "1.290.000đ",
                  price_discount: "1.390.000đ",
                  book_name: "Máy rửa xe Catorex - CTR",
                  book_category: "Điện máy Đỗ Dũng"
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemBookWidget extends StatelessWidget {
  final String book_image;
  final String book_name;
  final String book_category;
  final String price;
  final String price_discount;
  final double distance;

  const ItemBookWidget({
    Key? key, required this.book_image,
    required this.book_name,
    required this.price,
    required this.price_discount,
    required this.distance, required this.book_category,
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
              Image.asset(book_image,
              height: constraint.maxWidth/2-10,),
              Positioned(
                  child: Text("-20%")
              ),
              Positioned(
                  child: Text("-20%")
              )
            ],
            // Image.asset("")
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(book_name),
              SvgPicture.asset("assets/home/store/phone.svg", width: 15,)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 5,),
              Text(
                price_discount,
                style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough
                ),
              ),
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
                  Text(book_category,
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
          Container(
            padding: EdgeInsets.all(4),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/home/store/icon_re2.png", width: 10, ),
                    SizedBox(width: 2.0,),
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
                    SizedBox(width: 2.0,),
                    Text("33",
                      style: TextStyle(
                          fontSize: 10
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/home/store/icon_re2.png", width: 10,),
                    SizedBox(width: 2.0,),
                    Text("4.3",
                      style: TextStyle(
                        fontSize: 10
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


