
import 'package:flutter/material.dart';

class NewDetailPage extends StatelessWidget {
  const NewDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text("Bảo hiểm thân vỏ - bảo hiểm tự nguyện - dịch vụ sơn xe bảo hiểm"),
          Text("Admin  -  05/01/2020"),
          Text("Bảo hiểm thân vỏ ôtô là loại bảo hiểm để bồi thường cho các thiệt hại phát sinh do yếu tố bên ngoài tác động lên các bộ phận của xe ô tô(Vỏ, kính, gương,…).")
        ],
      ),
    );
  }
}
