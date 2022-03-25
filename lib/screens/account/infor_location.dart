
import 'package:flutter/material.dart';

import '../../containts/colors.dart';
import '../../widget/account/top_account_widget.dart';

class InformationLocation extends StatelessWidget {
  const InformationLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopAccountWidget(),
                SizedBox(height: 30,),
                Text("Thông tin địa chỉ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    separatorBuilder: (context, index) => Container(height: 10, color: kBackgroundColor, ),
                    itemBuilder: (context, index) =>  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nguyễn Thị Bích",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(Icons.note_outlined, color: kTextColor,)
                              ],
                            ),
                            SizedBox(height: 2,),
                            Text("0974745553",
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Text("6/86 Phùng khoang trung văn Nam Từ Liêm, Hà Nội",
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                Text("[ mặc định ]",
                                  style: TextStyle(
                                      color: kYellowColor
                                  ),),
                                Text("[ Địa chỉ lấy hàng ]",
                                  style: TextStyle(
                                      color: kTextLink
                                  ),)
                              ],
                            )
                          ],
                        )
                    )
                ),
                Container(height: 10, color: kBackgroundColor, ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {  },
                    child: Text("Thêm địa chỉ mới"),
                    style: ElevatedButton.styleFrom(
                        primary: kYellowColor
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );;
  }
}