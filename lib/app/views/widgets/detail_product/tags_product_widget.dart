
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/theme/app_colors.dart';



class TagsProductWidget extends StatelessWidget {
  const TagsProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _countrys = [
      'Máy rửa xe', 'Máy Cắt Sắt', 'Thái Lan', 'Boss 2300w', 'Thế hệ mới' , "Bình xịt bọt tuyết ống"
    ];
    return Column(
      children: [

        Container(
          padding: EdgeInsets.only(top: 15.h, left: 10.w),
          width: double.infinity,
          child: Text("Tags",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

        ),
        Divider(
          height: 20,
          color: kTextColor,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            child: Wrap(
              spacing: 5.0.w,
              children: _countrys.map((e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: OutlinedButton(
                      child: Row(
                        children: [
                          Text(e)
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: kTextColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ), onPressed: () {  },
                    ),
                  )
                ],
              )).toList(),
            )
        ),
      ],
    );
  }
}
