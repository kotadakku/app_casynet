
import 'package:flutter/material.dart';

class DisplayProductWidget extends StatefulWidget {
  const DisplayProductWidget({Key? key}) : super(key: key);

  @override
  State<DisplayProductWidget> createState() => _DisplayProductWidgetState();
}

class _DisplayProductWidgetState extends State<DisplayProductWidget> {
  bool _display = false;
  @override
  Widget build(BuildContext context) {
    List<String> _displays = [
      "Danh sách", "Dạng lưới", "Bản đồ",
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
                  Text("Hiển thị",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        _display = !_display;
                      });
                    },
                    iconSize: 20,
                    icon: Icon(Icons.keyboard_arrow_down_outlined)
                  )
                ],
              ),
            ),
            Visibility(
              visible: _display,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _displays.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_displays[index]),
                      Radio(value: true, onChanged: (value){
                      }, groupValue: 0,),
                    ],
                  );
                }
            ),
            )

          ],
        )
    );
  }
}
