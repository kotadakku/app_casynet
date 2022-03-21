
import 'package:app_casynet/screens/rua_xe_thay_dau.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> danhmuc = [
      ItemCategoryWidget(key: ValueKey(1),image_url: "assets/home/category/ruaxethaydau.png", title: "Rửa xe, thay dầu"),
      ItemCategoryWidget(key: ValueKey(2), image_url: "assets/home/category/suachuaxe.png", title: "Sửa chữa xe"),
      ItemCategoryWidget(key: ValueKey(3), image_url: "assets/home/category/dochoiphukien.png", title: "Đồ chơi, phụ kiện"),
      ItemCategoryWidget(key: ValueKey(4), image_url: "assets/home/category/muabanxe.png", title: "Mua bán xe"),
      ItemCategoryWidget(key: ValueKey(5), image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(key: ValueKey(6), image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:EdgeInsets.all(10.0),
          child: Text('DANH MỤC'),
        ),
        Wrap(
          runSpacing: 10,
          children: danhmuc,
        )
      ],
    );
  }
}


class ItemCategoryWidget extends StatelessWidget {
  final String image_url;
  final String title;
  const ItemCategoryWidget({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      LayoutBuilder(builder: (context, constraint) {
        return GestureDetector(
          onTap: (){
            if(key == ValueKey(1)){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return RuaXeThayDauPage();
              }));
            }
          },
          child: Container(
            width: constraint.maxWidth / 3,
            child: Column(
              children: [
                Image.asset(image_url, width: 50, height: 50,),
                SizedBox(height: 10,),
                Text(title),
              ],
            ),
          ),
        ) ;
      });
  }
}
