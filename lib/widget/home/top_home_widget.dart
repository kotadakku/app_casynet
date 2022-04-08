import 'package:app_casynet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Get.offNamed(Routes.HOME);
              },
              child: Container(
                  child: SvgPicture.asset(
                    "assets/home/icon_top_home.svg",
                    width: 40,
                  )
              ),
            )
          ),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Container(
              height: 35,
              child:  TextField(
                autofocus: false,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textGrayBoldColor,
                ),
                textAlignVertical: TextAlignVertical.center,
                cursorColor: kTextColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: AppColors.borderGray_0_5
                      )
                    
                  ),
                  hintStyle: const TextStyle(
                      fontSize: 11
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: kYellowColor
                    )

                  ),
                  hintText: 'Search Casynet',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: AppColors.borderGray_0_5,
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
          Flexible(
            flex: 1 ,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.all(5.0.w),
              child: TextButton(
                onPressed: () {

                },
                child: Text("VN",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.w
                  ),
                ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(
                  color: AppColors.borderGray_0_5,

                )
              ),
            )
            )
          )
        ],
      ),
    );

  }
}
