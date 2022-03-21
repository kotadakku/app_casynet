
import 'package:flutter/material.dart';

import '../../containts/colors.dart';

class PriceProductWidget extends StatelessWidget {
  const PriceProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text("Theo giá",
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
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: [
                    OutlinedButton(
                      child: Row(
                        children: [
                          Text("Giá cao")
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: kYellowColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ), onPressed: () {  },
                    ),
                    SizedBox(width: 10,),
                    OutlinedButton(
                      child: Row(
                        children: [
                          Text("Giá thập")
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: kYellowColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ), onPressed: () {  },
                    ),
                  ],
                )
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        const Text("Từ "),
                        Container(
                          width: 100,
                          height: 30,
                          child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        const Text("Đến "),
                        Container(
                          width: 100,
                          height: 30,
                          child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kTextColor, width: 1.0),
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ],
        )
    );
  }
}
