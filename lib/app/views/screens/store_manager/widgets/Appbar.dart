import 'package:flutter/material.dart';

class Appbars extends StatelessWidget {
  const Appbars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: const Color.fromARGB(224, 224, 224, 224),
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm trên cửa hàng',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
