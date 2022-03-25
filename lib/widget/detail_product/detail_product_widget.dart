
import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/containts/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProductWidget extends StatelessWidget {
  const DetailProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: kTextColor,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Chi tiết sản phẩm", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        ),
        Divider(color: kTextColor,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("""Giới thiệu cửa hàng 
Với trang thiết bị và cơ sở vật chất nhà xưởng hiện đại bậc nhất tại Việt Nam, THC áp dụng những quy chuẩn về chất lượng hàng đầu thế giới như Kaizen - Nhật Bản, tiêu chuẩn quốc tế ISO 9001, SAE hiệp hội ô tô Mỹ, tiêu chuẩn 5S về dịch vụ và nhà xưởng.
      
Chúng tôi là trung tâm dịch vụ sửa chữa ô tô đầu tiên đưa tiêu chuẩn 4s vào dịch vụ sửa chữa đó là 4 tiêu chuẩn:
        
Chất lượng sửa chữa bảo dưỡng
Phụ tùng phụ kiện chính hãng
Bảo hành sửa chữa và phụ tùng
Chăm sóc khách hàng
            """),

        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Xem thêm",
              style: TextStyle(
                color: kYellowColor
              ),

            ),
            Icon(Icons.keyboard_arrow_down, color: kYellowColor, size: sizeStar.width,)
          ],
        ),
        SizedBox(height: 20,)
      ]
    );
  }
}
