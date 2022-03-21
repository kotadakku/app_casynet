
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/colors.dart';

class CategoryProductWidget extends StatelessWidget {
  const CategoryProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _categories = [
      "Rửa xe, thay dầu", "Sửa chữa xe", "Đồ chơi, phụ kiện", "Mua bán xe", "Chăm sóc xe", "Lốp và ác quy xe"
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child:  Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [

                  const Text("Danh mục",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Container(
                width: double.infinity,
                child: Wrap(
                  spacing: 5.0,
                  children: _categories.map((e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: OutlinedButton(
                          child: Text(e),
                          style: OutlinedButton.styleFrom(
                              primary: kYellowColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                          ), onPressed: () {  },
                        ),
                      )
                    ],
                  )).toList(),
                )
            ),
          ],
        )
    );
  }
}
