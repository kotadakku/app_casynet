
import 'package:flutter/material.dart';

import '../../containts/colors.dart';

class TagsProductWidget extends StatelessWidget {
  const TagsProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _countrys = [
      'Máy rửa xe', 'Máy Cắt Sắt', 'Thái Lan', 'Boss 2300w', 'Thế hệ mới' , "Bình xịt bọt tuyết ống"
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child:  Column(
          children: [

            Container(
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
        )
    );
  }
}
