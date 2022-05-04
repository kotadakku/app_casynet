
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../account/widgets/appbar_account_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import 'widgets/step_benefit.dart';



class BenefitStore extends StatelessWidget {
  const BenefitStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> benefits = [
      "Được hỗ trợ xây dựng một trang web app chuyên nghiệp để giới thiệu về sản phẩm, dịch vụ cho mình mà không phải trả bất cứ chi phí nào.",
      "Đăng sản phẩm/dịch vụ để bán trên Casynet.com",
      "Được hỗ trợ công cụ để giới thiệu về từng mặt hàng, từng dịch vụ trên web app của mình.",
      "Kết nối nhanh chóng và thuận tiện với chủ xe thông qua các công cụ được tích hợp trong Casynet như: Chat trực tuyến, Gọi điện, Gửi thư, Nhắn tin, Chỉ đường trên bản đồ Google và đặc biệt là những Cửa hàng gần vị trí chủ xe đang truy cập Casynet sẽ được xuất hiện ngay trên màn hình thiết bị của chủ xe.",
      "Nhận đặt chỗ, đặt hàng/dịch vụ trước và từ xa của chủ xe, giúp Cửa hàng gia tăng doanh thu bán hàng cũng như sắp xếp thời gian phù hợp để phục vụ chủ xe.",
      "Dễ dàng thiết lập các chương trình khuyến mãi, tích điểm thưởng, các gói combo sản phẩm/dịch vụ cho chủ xe nhằm gia tăng khách hàng.",
      "Quản lý thanh toán của chủ xe; phân công công việc cho cán bộ nhân viên trong Cửa hàng  (Trong kế hoạch phát triển) ; quản lý hàng hóa nhập – xuất – tồn kho, báo cáo hàng bán trong mọi khoảng thời gian.",
      "Tận dụng dữ liệu lớn về chủ xe trong hệ thống Casynet để phát triển kinh doanh.",
      "Nhận phản hồi và đánh giá chất lượng từ chủ xe để khắc phục điểm yếu và phát huy thế mạnh."
    ];

    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBarAccountWidget(),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(

                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: kBackgroundColor,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 30,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: sizeIcon.height,
                                  ),
                                )
                            ),
                            Text(
                              "Lợi ích cho chủ cửa hàng",
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Image.asset("assets/benefit/image.png"),
                      SizedBox(height: 10,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text('LỢI ÍCH CHO CỬA HÀNG KHI THAM GIA',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("WEBSITE CUNG CẤP DỊCH VỤ TMĐT CASYNET.COM",  textAlign: TextAlign.center,),
                              SizedBox(height: 10,),
                              Text("Là hệ thống thương mại điện tử được thiết kế chuyên biệt dành riêng cho các cơ sở dịch vụ (Cửa hàng) về xe hơi - xe máy trong việc quảng bá sản phẩm, dịch vụ; triển khai nhanh chóng các chương trình khuyến mại; kết nối trực tuyến với khách hàng chủ xe; và giúp cửa hàng quản lý hiệu quả hơn.",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30,),
                              Text("Những lợi ích thiết thực mà Cửa hàng nhận được khi đăng ký gian hàng và trở thành đối tác của Casynet sẽ bao gồm nhưng không giới hạn như dưới đây:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 30,),
                      StepBenefit(benefits: benefits),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Image.asset("assets/benefit/image.png"),
                      ),

                      Container(
                        color: Color(0xffFFDD87),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Đừng chần chờ gì nữa, hãy tham gia Casynet ngay hôm nay, chúng tôi tin rằng bạn sẽ thích. \n',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '“ CASYNET - Join us you like”! ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              TextSpan(
                                text: 'hàng trên Casynet tại đây.',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'tại đây.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                )
            )
        ),
      ),
    );
  }
}
