import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/containts/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsStore extends StatelessWidget {
  const DetailsStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  "assets/detail_store/anhCuaHang.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                              "assets/detail_store/background.png"),
                          fit: BoxFit.fitHeight)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/detail_store/ower_store.png")),
                            border: Border.all(color: Colors.blue, width: 2),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CÔNG TY TNHH Ô TÔ MỸ ĐÌNH THC",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  "bulary 12019",
                                  style: TextStyle(color: kYellowColor),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: kYellowColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Online 3 giờ trước",
                                  style: TextStyle(color: kTextColor_gray),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.supervisor_account,
                                  color: kYellowColor,
                                  size: sizeStar.width,
                                ),
                                Text(
                                  "1.2k người theo dõi",
                                  style: TextStyle(color: kTextColor_gray),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(child: Container(
                                  height: 30,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: kYellowColor,
                                        ),
                                        Text(
                                          "Theo dõi",
                                          style: TextStyle(color: kYellowColor),
                                        )
                                      ],
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0, color: kYellowColor),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Container(
                                  height: 30,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: kYellowColor,
                                        ),
                                        Text(
                                          "Theo dõi",
                                          style: TextStyle(color: kYellowColor),
                                        )
                                      ],
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0, color: kYellowColor),
                                    ),
                                  ),
                                )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
