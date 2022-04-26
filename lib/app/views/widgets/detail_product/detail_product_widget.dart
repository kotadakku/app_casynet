
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/views/theme/app_colors.dart';
import '../../screens/theme/app_colors.dart';
import '../../screens/theme/app_sizes.dart';

class DetailProductWidget extends StatelessWidget {
  const DetailProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: kTextColor,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text("Chi tiết sản phẩm", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        ),
        Divider(color: kTextColor,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Obx(()=>Text("""Giới thiệu cửa hàng 
Với trang thiết bị và cơ sở vật chất nhà xưởng hiện đại bậc nhất tại Việt Nam, THC áp dụng những quy chuẩn về chất lượng hàng đầu thế giới như Kaizen - Nhật Bản, tiêu chuẩn quốc tế ISO 9001, SAE hiệp hội ô tô Mỹ, tiêu chuẩn 5S về dịch vụ và nhà xưởng.
      
Chúng tôi là trung tâm dịch vụ sửa chữa ô tô đầu tiên đưa tiêu chuẩn 4s vào dịch vụ sửa chữa đó là 4 tiêu chuẩn:
        
Chất lượng sửa chữa bảo dưỡng
Phụ tùng phụ kiện chính hãng
Bảo hành sửa chữa và phụ tùng
Chăm sóc khách hàng
            """,
          overflow: isReadMore.value ? TextOverflow.visible : TextOverflow.ellipsis,
          maxLines: isReadMore.value ? null : 10)
          )
        ),

        Obx(()=>GestureDetector(
          onTap: (){
            isReadMore.value = !isReadMore.value;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isReadMore.value ? "Ẩn bớt" : "Xem thêm",
                style: TextStyle(
                    color: kYellowColor
                ),

              ),
              Icon(isReadMore.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: kYellowColor, size: sizeIcon.width,)
            ],
          ),
        ),),
        SizedBox(height: 20,)
      ]
    );
  }
}
