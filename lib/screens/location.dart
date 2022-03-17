
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../containts.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 200),
                Image.asset("assets/splash/logo.png", width: 300,),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14                       ),
                        hintText: 'Khu vực của bạn',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                              "assets/home/icon_location.svg",
                              width: 15),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: SvgPicture.asset(
                              "assets/arrow_down.svg",
                              width: 14),
                        )
                    ),
                  ),
                ),

                Spacer(),
                Image.asset("assets/button_image_location.png"),
                SizedBox(height: 50,)
              ],
            )
          )
        ),
      )
      ;
  }
}
