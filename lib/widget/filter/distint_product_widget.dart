import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/colors.dart';

class DistintProductWidget extends StatelessWidget {
  const DistintProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _districts = [
      'Quận Cầu Giấy', 'Quận Hà Đông', 'Quận Hoàn Kiếm', 'Quận Hai Bà Trưng', 'Quận Mỹ Đình'
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

                  const Text("Quận/Huyện",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/home/icon_location.svg", height: 15,),
                        const SizedBox(width: 8,),
                        const Text("Hà Nội")
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: kYellowColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                    ), onPressed: () {  },
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
                  children: _districts.map((e) => Row(
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
