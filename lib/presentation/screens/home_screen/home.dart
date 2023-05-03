import 'package:flutter/material.dart';
import 'package:orangedegitalcenter/constans/consts.dart';
import 'package:sizer/sizer.dart';

import '../../widget/home_container.dart';
import '../../widget/rich_text.dart';

class Home_content extends StatelessWidget {
 // const Home_content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 20.sp,),
        Expanded(
          flex: 1,
            child: Richtext()),
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                ),
                itemCount: Constants.icons.length,
                itemBuilder: (BuildContext context, index){
                  return maincontainer(
                    title: Constants.titles[index],
                    icon: Constants.icons[index],
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Constants.pages[index],));
                    },
                  );
                }
            ),
          ),
        ),
      ],
    );
  }
}
