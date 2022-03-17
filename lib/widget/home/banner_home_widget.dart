
import 'package:flutter/material.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  List<String> banner_urls = [
    "assets/home/banner1.png",
    "assets/home/banner1.png"
  ];
  @override
  Widget build(BuildContext context) {
    // return Text("Hi");
    return SizedBox(
      height: MediaQuery.of(context).size.width/1125*410,
      child: PageView.builder(
        itemCount: banner_urls.length,
        itemBuilder: (context, index){
          return Stack(
            children: [
              Image.asset(banner_urls[index]),
              Positioned.fill(
                bottom: 8.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: indicators(index, banner_urls.length),),
              ))
            ],
          );
        }
      )
    );
  }
  List<Widget> indicators(curPage, numPage){
    return List.generate(numPage, (index) => Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: curPage == index ? Color(0xffD4AD0B): Colors.white,
          shape: BoxShape.circle
      ),
    ));
  }
}
