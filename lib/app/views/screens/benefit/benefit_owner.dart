
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/account/appbar_account_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import 'widgets/step_benefit.dart';


class BenefitOwner extends StatelessWidget {
  const BenefitOwner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> benefits = [
      "Nhanh chóng tìm thấy những Cửa hàng gần mình và dễ dàng tới đó theo chỉ dẫn của bản đồ Google tích hợp trong Casynet.",
      "Dễ dàng lựa chọn những Cửa hàng uy tín dựa trên đánh giá của cộng đồng chủ xe",
      "Dễ dàng tìm kiếm sản phẩm/dịch vụ mà mình đang cần.",
      "Đặt chỗ, đặt hàng trước và từ xa với Cửa hàng, giúp chủ xe đỡ mất thời gian chờ đợi.",
      "Nhanh chóng tìm thấy những Cửa hàng đang có các chương trình khuyến mại, giảm giá.",
      "Nhận tư vấn từ các Cửa hàng thông qua các công cụ Chát, Gọi điện, Gửi thư, Nhắn tin tích hợp trên Casynet.",
      "Đánh giá chất lượng dịch vụ, sản phẩm của Cửa hàng sau khi sử dụng."
    ];
    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBarAccountWidget(),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: ListView(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: kBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 30,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: sizeIcon.height,
                              ),
                            )),
                        Text(
                          "Lợi ích cho chủ xe",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset("assets/benefit/image.png"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            'LỢI ÍCH CHO CHỦ XE KHI THAM GIA',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "WEBSITE CUNG CẤP DỊCH VỤ TMĐT CASYNET.COM",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nếu bạn đang tìm kiếm 1 website mua bán các sản phẩm và dịch vụ dành riêng cho xe hơi - xe máy thì Casynet chính là lựa chọn tối ưu dành cho bạn. Tại đây, bạn có thể mua sắm các linh kiện và đặt chỗ các dịch vụ: rửa xe, sửa chữa, bảo dưỡng,... ở các gara hoặc cửa hàng trên toàn quốc.",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Dù bạn ở bất kì đâu, trong bất kì thời gian nào, chỉ cần truy cập vào website https://casynet.com hoặc app Casynet là có thể thỏa thích so sánh, lựa chọn, mua sắm tất cả những gì bạn cần cho “xế yêu” của mình.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  StepBenefit(benefits: benefits),
                  SizedBox(
                    height: 30,
                  ),
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
                            text: 'Đăng ký tài khoản Casynet',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' tại đây ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text:
                            'để sở hữu những sản phẩm tốt nhất, trải nghiệm những dịch vụ tuyệt vời nhất với những ưu đãi ngập tràn.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            )
        ),
      ),
    );
  }
}
