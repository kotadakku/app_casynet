
import 'package:flutter/material.dart';

class AttributeProductWidget extends StatelessWidget {
  const AttributeProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? _attrs = [
      "Mới nhất", "Gần tôi", "Nổi bật", "Đặt nhiều", "Uy tín", "Giá thấp", "Giá cao"
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
                children: const [
                  Text("Thuộc tính",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            // danh sách các thuộc tính
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _attrs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_attrs[index]),
                      Radio(value: true, onChanged: (value){
                      }, groupValue: 0,),
                    ],
                  );
                }
            ),
          ],
        )
    );
  }
}
