
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';

import '../../utlis/languages/localization_service.dart';
import '../theme/app_colors.dart';

class ButtonLanguage extends StatefulWidget {
  const ButtonLanguage({Key? key}) : super(key: key);

  @override
  State<ButtonLanguage> createState() => _ButtonLanguageState();
}

class _ButtonLanguageState extends State<ButtonLanguage> {

  String _selectedLang = LocalizationService.locale!.languageCode;


  @override
  Widget build(BuildContext context) {

    return Container(
        width: 40,
        margin: EdgeInsets.only(right: 5.0.w, top: 10.0, bottom: 10.0),
        child: TextButton(
          onPressed: (){
            if(_selectedLang == 'vi'){
              setState(() => _selectedLang = 'en');
              LocalizationService.changeLocale('en');

            }
            else {
              setState(() => _selectedLang = 'vi');
              LocalizationService.changeLocale('vi');
            };

          },
          child: Text(_selectedLang.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp
            ),
          ),
          style: TextButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(
                color: AppColors.borderGray_0_5,

              )
          ),
        )
    );
  }
}
