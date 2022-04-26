import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbars extends StatelessWidget {
  const Appbars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Color.fromARGB(224, 224, 224, 224),
      margin: new EdgeInsets.only(top: 40, bottom: 40),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm trên cửa hàng',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
