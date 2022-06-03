
import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';

class StepBenefit extends StatelessWidget {
 final List<String> benefits;
  const StepBenefit({Key? key, required this.benefits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: benefits.length,
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemBuilder: (context, index) =>
            Row(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.yellowColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text('${index+1}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                Expanded(child: Text( benefits[index],
                  overflow: TextOverflow.fade,
                ))

              ],
            )
    );
  }
}
