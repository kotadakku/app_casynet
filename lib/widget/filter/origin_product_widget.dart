
import 'package:flutter/material.dart';

import '../../containts/colors.dart';

class OriginProductWidget extends StatelessWidget {
  const OriginProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _countrys = [
      'Mỹ', 'Việt Nam', 'Trung Quốc', 'Nhật Bản', 'Thái Lan', 'Thụy Điển'
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child:  Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text("Xuất sứ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Container(
                width: double.infinity,
                child: Wrap(
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
