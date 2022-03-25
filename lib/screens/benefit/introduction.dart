import 'package:app_casynet/screens/benefit/widget/step_benefit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../containts/colors.dart';
import '../../widget/account/top_account_widget.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> intro_stores = [
      "Được hỗ trợ xây dựng một trang web app chuyên nghiệp để giới thiệu về sản phẩm, dịch vụ cho mình mà không phải trả bất cứ chi phí nào.",
      "Đăng sản phẩm/dịch vụ để bán trên Casynet.com",
      "Được hỗ trợ công cụ để giới thiệu về từng mặt hàng, từng dịch vụ trên web app của mình.",
      "Kết nối nhanh chóng và thuận tiện với chủ xe thông qua các công cụ được tích hợp trong Casynet như: Chat trực tuyến, Gọi điện, Gửi thư, Nhắn tin, Chỉ đường trên bản đồ Google và đặc biệt là những Cửa hàng gần vị trí chủ xe đang truy cập Casynet sẽ được xuất hiện ngay trên màn hình thiết bị của chủ xe",
      "Nhận đặt chỗ, đặt hàng/dịch vụ trước và từ xa của chủ xe, giúp Cửa hàng gia tăng doanh thu bán hàng cũng như sắp xếp thời gian phù hợp để phục vụ chủ xe.",
      "Dễ dàng thiết lập các chương trình khuyến mãi, tích điểm thưởng, các gói combo sản phẩm/dịch vụ cho chủ xe nhằm gia tăng khách hàng.",
      "Quản lý thanh toán của chủ xe; phân công công việc cho cán bộ nhân viên trong Cửa hàng  (Trong kế hoạch phát triển) ; quản lý hàng hóa nhập – xuất – tồn kho, báo cáo hàng bán trong mọi khoảng thời gian.",
      "Tận dụng dữ liệu lớn về chủ xe trong hệ thống Casynet để phát triển kinh doanh",
      "Nhận phản hồi và đánh giá chất lượng từ chủ xe để khắc phục điểm yếu và phát huy thế mạnh."
    ];
    List<String> intro_owers = [
      "Nhanh chóng tìm thấy những Cửa hàng gần mình và dễ dàng tới đó theo chỉ dẫn của bản đồ Google tích hợp trong Casynet.",
      "Dễ dàng lựa chọn những Cửa hàng uy tín dựa trên đánh giá của cộng đồng chủ xe.",
      "Dễ dàng tìm kiếm sản phẩm/dịch vụ mà mình đang cần.",
      "Đặt chỗ, đặt hàng trước và từ xa với Cửa hàng, giúp chủ xe đỡ mất thời gian chờ đợi.",
      "Nhanh chóng tìm thấy những Cửa hàng đang có các chương trình khuyến mại, giảm giá.",
      "Nhận tư vấn từ các Cửa hàng thông qua các công cụ Chát, Gọi điện, Gửi thư, Nhắn tin tích hợp trên Casynet.",
      "Đánh giá chất lượng dịch vụ, sản phẩm của Cửa hàng sau khi sử dụng."
    ];
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: ListView(

                  children: [
                    TopAccountWidget(),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: kBackgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text("Giới thiệu",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Stack(
                      children: [
                        Image.asset("assets/benefit/image.png"),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text("WEBSITE CUNG CẤP"),
                                Text("DỊCH VỤ TMĐT CASYNET.COM", style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          )
                        )
                      ],
                    ),

                    SizedBox(height: 10,),

                    Text("Casynet là nền tảng công nghệ về thương mại điện tử hoàn toàn miễn phí giúp các cơ sở dịch vụ(Cửa hàng) về xe hơi, xe máy kết nối dễ dàng và nhanh chóng với chủ xe. Đến với Casynet, các cửa hàng và chủ xe sẽ nhận được nhiều lợi ích thiết thực.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30,),
                    Image.asset("assets/benefit/image.png"),
                    SizedBox(height: 30,),
                    Text("Cơ sở dịch vụ (Cửa hàng):",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,),
                    StepBenefit(benefits: intro_stores),
                    SizedBox(height: 30,),
                    Image.asset("assets/benefit/image.png"),
                    SizedBox(height: 30,),
                    Text("Chủ xe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30,),
                    StepBenefit(benefits: intro_owers),
                  ]
              ),
            ),
          )
      ),
    );;
  }
}
