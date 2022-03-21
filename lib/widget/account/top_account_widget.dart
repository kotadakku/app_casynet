
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/colors.dart';




class TopAccountWidget extends StatelessWidget {
  const TopAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kTextColor,
              offset: const Offset(
                0.0,
                13.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 12.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ]
        ),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    child: SvgPicture.asset(
                      "assets/home/icon_top_home.svg",
                      width: 40,
                    )
                )
            ),
            // TextField Tìm kiếm
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Container(
                height: 35,
                child:  TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 11
                      ),
                      hintText: 'Search Casynet',
                      prefixIcon: SizedBox(width: 50, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: [
                              // Icon vị trí
                              Icon(Icons.search, color: kYellowColor,),
                              VerticalDivider(
                                width: 10,
                                thickness: 1,
                                indent: 5,
                                endIndent: 5,
                                color: Colors.grey,
                              ),
                            ],
                          )
                      ),),

                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            VerticalDivider(
                              width: 10,
                              thickness: 1,
                              indent: 5,
                              endIndent: 5,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2.0,),
                            SvgPicture.asset(
                                "assets/home/icon_location.svg",
                                width: 14),
                            const SizedBox(width: 5.0,),
                            const Text(
                              "Hà Nội",
                            ),
                            const SizedBox(width: 5.0,),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ),
            // Ngôn ngữ VN/
            Flexible(
                flex: 1 ,
                fit: FlexFit.tight,
                child: Center(child: Text("VN")
                )
            )
          ],
        ),
      )
    );

  }
}
