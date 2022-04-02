
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widget/account/top_account_widget.dart';

class FollowedStorePage extends StatelessWidget {
  const FollowedStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAccountWidget(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Cửa hàng theo dõi",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Divider(
              thickness: 10,
              color: kBackgroundColor,
            ),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index){
                return Divider();
              },
              itemBuilder: (context, index) => Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text("1232") ,
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gara Ô Tô Hà Nội Car Sevices",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Text("số 2 Phố Trần Hữu Dực, Mỹ Đình, Từ Liêm, Hà Nội",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: kTextColor_gray
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      OutlinedButton(
                                          onPressed: (){},
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide.none
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(2.0),
                                                child: Icon(Icons.add, color: kTextColor,),
                                              ),
                                              Text("Vào cửa hàng",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14
                                                ),
                                              )
                                            ],
                                          )),
                                      OutlinedButton(
                                          onPressed: (){},
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(color: Colors.red)
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(2.0),
                                                child: Icon(Icons.add, color: Colors.red,),
                                              ),
                                              Text("Bỏ theo dõi",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )
                      )
                    ],
                  )
              ), itemCount: 3,),
          ],
        ),
      ),
    );
  }
}
