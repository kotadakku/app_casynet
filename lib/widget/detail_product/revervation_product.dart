
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../containts/colors.dart';
import '../../containts/size.dart';

class RevervationProductWidget extends StatelessWidget {
  const RevervationProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,

            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                hintText: "Chọn của hàng áp dụng",
                hintStyle: TextStyle(
                  fontSize: 12,

                  color: kTextColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                ),
                prefixIcon: Icon(Icons.storefront, size: sizeStar.width, color: kTextColor,),
                suffix: DropdownButton<String>(
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                      height: 30,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            prefixIcon: Icon(Icons.calendar_today, color: kTextColor, size: sizeStar.width,)
                        ),
                      )
                  )
              ),
              SizedBox(width: 10,),
              Flexible(
                  flex: 1,
                  child: Container(
                      height: 30,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kTextColor, width: 1.0),
                            ),
                            prefixIcon: Icon(Icons.calendar_today, color: kTextColor, size: sizeStar.width,)
                        ),
                      )
                  )
              ),
            ],

          ),
          SizedBox(height: 10,),

          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: "Điền ghi chú tại đây ...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kTextColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kTextColor, width: 1.0),
              ),
              hintStyle: TextStyle(
                fontSize: 12,

                color: kTextColor,
              ),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("DONE Đặt chỗ ngay",
                  style: TextStyle(
                  ),
                ),
              style: ElevatedButton.styleFrom(
                primary: kYellowColor
              ),

            ),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/detail_product/phone-volume.svg", height: 20),
              SizedBox(width: 5,),
              Text("Hoặc gọi tới: "),
              Text("0962.68.87.68" , style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(height: 5.0,),
          Text("Để đặt chỗ và được tư vấn")
        ],
      ),
    );
  }
}
