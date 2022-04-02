
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../data.dart';
import '../../theme/app_colors.dart';

class ProfileStoreWidget extends StatelessWidget {
  var id = Get.parameters['storeId'] ?? 1;
  ProfileStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
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
                        stores[int.parse(id.toString())-1]["image_url"],)),
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
                    stores[int.parse(id.toString())-1]["name"],
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
                        size: sizeIcon.width,
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
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.share,
                                  color: kYellowColor,
                                  size: sizeIcon.width,
                                ),
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
                        padding: EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.message_outlined,
                                  color: kYellowColor,
                                  size: sizeIcon.width,
                                ),
                              ),
                              Text(
                                "Chat",
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
        ));
  }
}
