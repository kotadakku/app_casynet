import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shimmer_loading.dart';

class CategoryShimer extends StatelessWidget {
  const CategoryShimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 160,
        child: Center(
          child: Stack(
            children: [
              LayoutBuilder(
                  builder: (context, constraints) {
                    int device = constraints.maxWidth>=780 ? 5 : 3;
                    return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (80/(ScreenUtil().screenWidth/device)),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        children: List.generate(6, (index) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ShimmerLoading(isLoading: true, child: Container(

                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            )),
                            SizedBox(height: 10,),
                            ShimmerLoading(isLoading: true, child: Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            )),

                          ],
                        ),)
                    );
                  }
              ),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        )
    );
  }
}